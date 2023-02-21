import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/result.dart';

/// API 요청을 담당하는 클래스.
class Api {
  static const Duration _timeLimit = Duration(seconds: 10);
  static const String _baseUrl = "localhost";

  /// 기본 오류 메시지.
  static const String defaultErrorMessage =
      "오류가 발생하였습니다.\n이 오류가 계속 발생하는 경우 개발자에게 문의해주세요.";

  /// 네트워크 오류 메시지.
  static const String networkErrorMessage =
      "네트워크 연결이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.";

  final http.Client _client;

  /// API 클래스를 생성합니다. 앞으로 [_client]를 사용하여 백엔드 서버로 HTTP 요청을 보냅니다.
  Api(this._client);

  /// POST 요청을 보냅니다.
  ///
  /// [path] 지정시 자동으로 [_baseUrl]과 결합하여 해당 주소로 요청을 전송합니다.
  /// [headers]와 [body]는 HTTP 요청 헤더와 바디에 넣습니다.
  /// 반환 값은 [Result]로, 성공 시 [Result.success]를, 실패 시 [Result.failure]를 반환합니다.
  Future<Result<dynamic>> post(String path,
      {Map<String, String>? headers, Object? body}) async {
    return request(
      HttpMethod.post,
      path,
      headers: headers,
      body: body,
    );
  }

  /// GET 요청을 보냅니다.
  ///
  /// [path] 지정시 자동으로 [_baseUrl]과 결합하여 해당 주소로 요청을 전송합니다.
  /// [headers]는 HTTP 요청 헤더에 넣습니다.
  /// 반환 값은 [Result]로, 성공 시 [Result.success]를, 실패 시 [Result.failure]를 반환합니다.
  Future<Result<dynamic>> get(String path,
      {Map<String, String>? headers}) async {
    return request(
      HttpMethod.get,
      path,
      headers: headers,
    );
  }

  /// 파일 하나를 multipart/form-data의 형식으로 업로드합니다.
  ///
  /// [path] 지정시 자동으로 [_baseUrl]과 결합하여 해당 주소로 [filePath]에 있는 파일을 전송합니다.
  /// [headers]는 HTTP 요청 헤더에 넣습니다.
  /// 반환 값은 [Result]로, 성공 시 [Result.success]를, 실패 시 [Result.failure]를 반환합니다.
  Future<Result<dynamic>> postFile(String path, String filePath,
      {Map<String, String>? headers}) async {
    final request = http.MultipartRequest('POST', Uri.parse(_baseUrl + path));
    request.headers.addAll(headers ?? {});
    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    final streamedResponse = await _client.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode ~/ 100 == 2) {
      return Result.success(jsonDecode(response.body));
    } else {
      return const Result.failure(defaultErrorMessage);
    }
  }

  /// HTTP 요청을 보냅니다. [method]를 통해 HTTP 메소드를 지정할 수 있습니다.
  ///
  /// [path] 지정시 자동으로 [_baseUrl]과 결합하여 해당 주소로 요청을 전송합니다.
  /// [headers]와 [body]는 HTTP 요청 헤더와 바디에 넣습니다.
  /// 반환 값은 [Result]로, 성공 시 [Result.success]를, 실패 시 [Result.failure]를 반환합니다.
  Future<Result<dynamic>> request(
    HttpMethod method,
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    print("$method $path");
    final sendHeaders = {...?headers};

    try {
      final http.Response response;

      switch (method) {
        case HttpMethod.get:
          response = await _client
              .get(
                Uri.parse(_baseUrl + path),
                headers: sendHeaders,
              )
              .timeout(_timeLimit);
          break;
        case HttpMethod.post:
          response = await _client
              .post(
                Uri.parse(_baseUrl + path),
                headers: sendHeaders,
                body: body,
              )
              .timeout(_timeLimit);
      }

      print(response);
      if (response.statusCode ~/ 100 == 2) {
        return Result.success(jsonDecode(response.body));
      } else {
        return const Result.failure(defaultErrorMessage);
      }
    } catch (e) {
      print(e);
      return const Result.failure(networkErrorMessage);
    }
  }
}

/// HTTP 메소드를 나타내는 열거형입니다. [Api] 클래스에서 사용됩니다. (필요시 종류 추가)
enum HttpMethod {
  get,
  post,
}

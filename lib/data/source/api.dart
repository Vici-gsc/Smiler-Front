import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/result.dart';

class Api {
  static const Duration timeLimit = Duration(seconds: 10);
  static const String baseUrl = "localhost";
  static const String defaultErrorMessage =
      "오류가 발생하였습니다.\n이 오류가 계속 발생하는 경우 개발자에게 문의해주세요.";
  static const String networkErrorMessage =
      "네트워크 연결이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.";

  final http.Client client;

  Api(this.client);

  Future<Result<dynamic>> post(String path,
      {Map<String, String>? headers, Object? body}) async {
    return request(
      HttpMethod.post,
      path,
      headers: headers,
      body: body,
    );
  }

  Future<Result<dynamic>> get(String path,
      {Map<String, String>? headers}) async {
    return request(
      HttpMethod.get,
      path,
      headers: headers,
    );
  }

  Future<Result<dynamic>> postFile(String path, String uri,
      {Map<String, String>? headers}) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl + path));
    request.headers.addAll(headers ?? {});
    request.files.add(await http.MultipartFile.fromPath('file', uri));

    final streamedResponse = await client.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode ~/ 100 == 2) {
      return Result.success(jsonDecode(response.body));
    } else {
      return Result.failure(defaultErrorMessage);
    }
  }

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
          response = await client
              .get(
                Uri.parse(baseUrl + path),
                headers: sendHeaders,
              )
              .timeout(timeLimit);
          break;
        case HttpMethod.post:
          response = await client
              .post(
                Uri.parse(baseUrl + path),
                headers: sendHeaders,
                body: body,
              )
              .timeout(timeLimit);
      }

      print(response);
      if (response.statusCode ~/ 100 == 2) {
        return Result.success(jsonDecode(response.body));
      } else {
        return Result.failure(defaultErrorMessage);
      }
    } catch (e) {
      print(e);
      return const Result.failure(networkErrorMessage);
    }
  }
}

enum HttpMethod {
  get,
  post,
}

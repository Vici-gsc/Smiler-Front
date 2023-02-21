import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/result.dart';

class Api {
  static const timeLimit = Duration(seconds: 10);
  static const baseUrl = "localhost";

  Api();

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

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode ~/ 100 == 2) {
      return Result.success(jsonDecode(response.body));
    } else {
      return Result.failure(
          "${response.statusCode} Error: ${response.reasonPhrase}");
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
          response = await http
              .get(
                Uri.parse(baseUrl + path),
                headers: sendHeaders,
              )
              .timeout(timeLimit);
          break;
        case HttpMethod.post:
          response = await http
              .post(
                Uri.parse(baseUrl + path),
                headers: sendHeaders,
                body: body,
              )
              .timeout(timeLimit);
      }

      if (response.statusCode ~/ 100 == 2) {
        return Result.success(jsonDecode(response.body));
      } else {
        return Result.failure(
            "${response.statusCode} Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print(e);
      return const Result.failure("Internal Error");
    }
  }
}

enum HttpMethod {
  get,
  post,
}

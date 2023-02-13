import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/result.dart';

class Api {
  static const timeLimit = Duration(seconds: 10);
  static const baseUrl = "localhost";
  static const Map<String, String> defaultHeaders = {
    "Content-Type": "application/json; charset=UTF-8",
  };

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

  Future<Result<dynamic>> request(
    HttpMethod method,
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    print("$method $path");
    final sendHeaders = {...defaultHeaders, ...?headers};

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

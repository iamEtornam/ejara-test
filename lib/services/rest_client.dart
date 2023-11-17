import 'package:dio/dio.dart';
import 'package:ejara_assignment/util/local_storage.dart';
import 'package:flutter/material.dart';

/// Global `Rest` Client Stub
abstract class RestClient {
  /// Call this to make a `GET` request
  Future<T?> get<T>(
    String path, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParams,
  });

  /// Call this to make a `POST` request
  Future<T?> post<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
  });
}

class RestClientImpl implements RestClient {
  RestClientImpl._privateConstructor();

  static final RestClientImpl _instance = RestClientImpl._privateConstructor();

  factory RestClientImpl() {
    return _instance;
  }

  final dio = Dio(BaseOptions(
      baseUrl: 'https://testbox-nellys-coin.ejaraapis.xyz/api',
      headers: {
        "Accept": "application/json",
      }));

  Future<Map<String, String>> _getHeaders() async {
    final token = await LocalStorage.readAccessToken();
    debugPrint('token: $token');

    Map<String, String> headers;
    if (token == null || token.isEmpty) {
      headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };
    } else {
      headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
    }
    return headers;
  }

  @override
  Future<T?> get<T>(String path,
      {Map<String, String> headers = const {},
      Map<String, dynamic>? queryParams}) async {
    final response = await dio.get(
      path,
      queryParameters: queryParams,
      options: Options(headers: await _getHeaders()),
    );
    if (response.statusCode == 200) {
      return response.data as T;
    }
    throw response.data;
  }

  @override
  Future<T?> post<T>(String path,
      {Map<String, String> headers = const {},
      Map<String, dynamic> body = const {},
      Map<String, dynamic>? queryParams}) async {
    final response = await dio.post(
      path,
      data: body,
      queryParameters: queryParams,
      options: Options(headers: await _getHeaders()),
    );
    if (response.statusCode == 200) {
      return response.data as T;
    }
    throw response.data;
  }
}

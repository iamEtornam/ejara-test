import 'package:ejara_assignment/config/config.dart';
import 'package:ejara_assignment/services/injection_container.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationRepository {
  Future<Map<String, dynamic>?> login(String username, String password);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  RestClient get _restClient => getIt<RestClient>();

  @override
  Future<Map<String, dynamic>?> login(String username, String password) async {
    const path = '${Config.baseUrl}/auth/login';
    final body = {
      'log': username,
      'password': password,
    };
    try {
      final response = await _restClient.post(path, body: body);

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

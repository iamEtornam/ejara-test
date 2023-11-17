import 'package:ejara_assignment/features/models/user/user.dart';
import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:ejara_assignment/util/local_storage.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthenticationRepository authenticationRepository;
  final LocalStorage localStorage;

  AuthenticationProvider(this.authenticationRepository, this.localStorage);

  Future<bool> login(String username, String password) async {
    final res = await authenticationRepository.login(username, password);
    if (res != null) {
      final user = User.fromJson(res);
      if (user.token != null) {
        await Future.wait([
          localStorage.saveToken(user.token!),
          localStorage.saveRefreshToken(user.refreshToken!),
          localStorage.saveUser(user),
        ]);
      }

      return res.isNotEmpty;
    }
    return false;
  }
}

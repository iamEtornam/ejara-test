import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthenticationRepository authenticationRepository;

  AuthenticationProvider(this.authenticationRepository);

  Future<bool> login(String username, String password) async {
    return await authenticationRepository.login(username, password);
  }
}

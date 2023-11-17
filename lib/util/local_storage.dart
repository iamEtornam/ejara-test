import 'dart:convert';

import 'package:ejara_assignment/features/models/user/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

FlutterSecureStorage get storage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ));

class LocalStorage {
  LocalStorage._privateConstructor();

  static final LocalStorage _instance = LocalStorage._privateConstructor();

  factory LocalStorage() {
    return _instance;
  }

  Future<void> saveToken(String value) async {
    await storage.write(key: 'token', value: value);
  }

  Future<void> saveRefreshToken(String value) async {
    await storage.write(key: 'refresh_token', value: value);
  }

  Future<String?> readAccessToken() async {
    return await storage.read(key: 'token');
  }

  Future<String?> readRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  Future<void> deleteRefreshToken() async {
    await storage.delete(key: 'refresh_token');
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  Future<bool> saveUser(User user) async {
    final sharedPreference = await SharedPreferences.getInstance();
    return await sharedPreference.setString('user', json.encode(user.toJson()));
  }

  Future<User?> getUser() async {
    final sharedPreference = await SharedPreferences.getInstance();
    final data = sharedPreference.getString('user');
    return data == null ? null : User.fromJson(json.decode(data));
  }
}

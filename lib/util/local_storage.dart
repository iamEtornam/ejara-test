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

  static Future<void> saveToken(String value) async {
    await storage.write(key: 'token', value: value);
  }

  static Future<void> saveRefreshToken(String value) async {
    await storage.write(key: 'refresh_token', value: value);
  }

  static Future<String?> readAccessToken() async {
    return await storage.read(key: 'token');
  }

  static Future<String?> readRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  static Future<void> deleteRefreshToken() async {
    await storage.delete(key: 'refresh_token');
  }

  static Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  static Future<bool> user(User user) async {
    final sharedPreference = await SharedPreferences.getInstance();
    return await sharedPreference.setString('user', json.encode(user.toJson()));
  }
}

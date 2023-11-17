import 'package:ejara_assignment/features/models/user/user.dart';
import 'package:ejara_assignment/services/injection_container.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:ejara_assignment/util/local_storage.dart';

abstract class AuthenticationRepository {
  Future<bool> login(String username, String password);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  RestClient get _restClient => getIt<RestClient>();

  @override
  Future<bool> login(String username, String password) async {
    const path = 'v1/auth/login';
    final body = {
      'log': username,
      'password': password,
    };
    try {
      final response = await _restClient.post(path, body: body);
      final user = User.fromJson(response);
      Future.wait([
        LocalStorage.saveToken(user.token!),
        LocalStorage.saveRefreshToken(user.refreshToken!),
        LocalStorage.user(user),
      ]);
      return response.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }
}

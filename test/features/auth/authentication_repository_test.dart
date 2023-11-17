import 'package:ejara_assignment/config/config.dart';
import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/core_mock.dart';

void main() {
  late RestClient restClient;

  setUpAll(() {
    final rs = MockRestClient();

    restClient = getIt.registerSingleton<RestClient>(rs);
  });

  test('user login test', () async {
    final authenticationRepository = AuthenticationRepositoryImpl(restClient);

    when(() => restClient.post('${Config.baseUrl}/auth/login',
            body: {'log': 'username', 'password': 'password'}))
        .thenAnswer((_) => Future.value({
              "responsecode": "login_ok",
              "message": "Login successful",
            }));

    final result = await authenticationRepository.login('username', 'password');

    expect(result!.isNotEmpty, true);
    expect(result, isA<Map<String, dynamic>>());
  });
}

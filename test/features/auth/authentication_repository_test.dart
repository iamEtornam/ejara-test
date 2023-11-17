import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/core_mock.dart';

void main() {
  late RestClient restClient;

  setUpAll(() {
    restClient = MockRestClient();

    getIt.registerSingleton<RestClient>(restClient);
  });

  test('user login test', () async {
    final authenticationRepository = AuthenticationRepositoryImpl();

    when(() => restClient
            .post('', body: {'username': 'username', 'password': 'password'}))
        .thenAnswer((_) => Future.value({
              "responsecode": "login_ok",
              "message": "Login successful",
            }));

    final result = await authenticationRepository.login('username', 'password');

    expect(result, true);
  });
}

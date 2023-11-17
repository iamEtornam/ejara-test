import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:ejara_assignment/util/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/core_mock.dart';

void main() {
  late LocalStorage localStorage;
  setUp(() {
    localStorage = MockLocalStorage();
  });
  test('login should work', () async {
    localStorage = MockLocalStorage();
    final mockRepo = MockAuthenticationRepository();
    final authProvider = AuthenticationProvider(mockRepo, localStorage);

    when(() => mockRepo.login('username', 'password'))
        .thenAnswer((_) => Future.value({
              "responsecode": "login_ok",
              "message": "Login successful",
            }));

    final res = await authProvider.login('username', 'password');

    expect(res, true);

    expect(res, isA<bool>());
  });
}

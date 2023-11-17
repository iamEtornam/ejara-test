
import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/core_mock.dart';

void main() {
  test('login should work', () async {
    final mockRepo = MockAuthenticationRepository();
    final authProvider = AuthenticationProvider(mockRepo);

    when(() => mockRepo.login('username', 'password'))
        .thenAnswer((_) => Future.value(true));

    final res = await authProvider.login('username', 'password');

    expect(res, true);

    expect(res, isA<bool>());
  });
}

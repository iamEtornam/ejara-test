import 'package:ejara_assignment/config/config.dart';
import 'package:ejara_assignment/features/repositories/payment_repository.dart';
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

  tearDown(() {
    getIt.reset();
    resetMocktailState();
  });

  test('fetch all payment settings test', () async {
    final paymentRepository = PaymentRepositoryImpl(restClient);
    const paymentTypeId = 1;

    when(
        () =>
            restClient
                .get('${Config.baseUrl}/customer/payment-settings-per-type',
                    queryParams: {
                  'countryCode': 'CM',
                  'transactionType': 'buy',
                  'paymentTypeId': '$paymentTypeId'
                })).thenAnswer((_) => Future.value({
          "responseCode": "payment_settings_per_type_ok",
          "message": "get payment settings per type successful",
          "data": []
        }));

    final result = await paymentRepository.getPaymentSettings(paymentTypeId);

    expect(result, isA<Map<String, dynamic>>());
    expect(result['data'].isEmpty, true);
  });
}

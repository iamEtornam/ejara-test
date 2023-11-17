import 'package:ejara_assignment/features/repositories/payment_repository.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/core_mock.dart';

void main() {
  late RestClient? restClient;

  setUpAll(() {
    restClient = MockRestClient();
    getIt.registerSingleton<RestClient>(restClient!);
  });

  tearDown(() => restClient = null);

  test('fetch all payment method test', () async {
    final paymentRepository = PaymentRepositoryImpl();

    when(() => restClient!.get('https://ejara.com/api/v1/payment-types',
            queryParams: {'countryCode': 'CM', 'transactionType': 'buy'}))
        .thenAnswer((_) => Future.value({
              "responseCode": "get_payment_types_per_country_ok",
              "message": "2 payment type(s) found",
              "data": [
                {
                  "id": 1,
                  "code": "MOMO",
                  "title_en": "Mobile Money",
                  "title_fr": "Mobile Money",
                  "description_en": "Instantly - 3.1% Telco Fees",
                  "min_amount": 0,
                  "description_fr": "Instantanément - 3.1% de frais",
                  "icon_image": ""
                },
                {
                  "id": 2,
                  "code": "BAC",
                  "title_en": "Bank",
                  "title_fr": "Banque",
                  "description_en": "1 business Day",
                  "min_amount": 0,
                  "description_fr": "1 jour ouvrable",
                  "icon_image": ""
                }
              ]
            }));

    final result = await paymentRepository.getPaymentMethods();

    expect(result, isA<Map<String, dynamic>>());
    expect(result['data'].isNotEmpty, true);
    expect(result.isNotEmpty, true);
  });

  test('fetch all payment settings test', () async {
    final paymentRepository = PaymentRepositoryImpl();
    const paymentTypeId = 1;

    when(
        () =>
            restClient!
                .get('https://ejara.com/api/v1/payment-types', queryParams: {
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

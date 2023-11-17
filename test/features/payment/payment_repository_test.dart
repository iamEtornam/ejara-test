import 'package:ejara_assignment/config/config.dart';
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

  tearDown(() {
    restClient = null;
    getIt.reset();
    resetMocktailState();
  });

  test('fetch all payment method test', () async {
    final paymentRepository = PaymentRepositoryImpl();

    when(
        () => restClient!.get(
                '${Config.baseUrl2}/marketplace/payment-types-per-country',
                queryParams: {
                  'countryCode': 'CM',
                  'transactionType': 'buy',
                })).thenAnswer((_) => Future.value({
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
}

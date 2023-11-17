import 'package:ejara_assignment/features/models/payment/payment_type.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
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

  test('get payment method should work', () async {
    final mockRepo = MockPaymentRepository(restClient);
    final paymentProvider = PaymentProvider(mockRepo);

    when(() => mockRepo.getPaymentMethods()).thenAnswer((_) => Future.value({
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

    final paymentType = await paymentProvider.getPaymentMethods();

    expect(paymentType.data!.isNotEmpty, true);

    expect(paymentType, isA<PaymentType>());
  });

  test('get payment settings should work', () async {
    final mockRepo = MockPaymentRepository(restClient);
    final authProvider = PaymentProvider(mockRepo);
    const paymentTypeId = 1;

    when(() => mockRepo.getPaymentSettings(paymentTypeId))
        .thenAnswer((_) => Future.value({
              "responseCode": "payment_settings_per_type_ok",
              "message": "get payment settings per type successful",
              "data": []
            }));

    final paymentSettings =
        await authProvider.getPaymentSettings(paymentTypeId);

    expect(paymentSettings.isNotEmpty, true);

    expect(paymentSettings, isA<Map<String, dynamic>>());
  });
}

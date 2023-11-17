import 'package:ejara_assignment/services/injection_container.dart';
import 'package:ejara_assignment/services/rest_client.dart';

abstract class PaymentRepository {
  Future<Map<String, dynamic>> getPaymentMethods();
  Future<Map<String, dynamic>> getPaymentSettings(int paymentTypeId);
}

class PaymentRepositoryImpl implements PaymentRepository {
  RestClient get _restClient => getIt<RestClient>();

  @override
  Future<Map<String, dynamic>> getPaymentMethods() async {
    const path = 'v2/marketplace/payment-types-per-country';
    final queryParams = <String, dynamic>{
      'countryCode': 'CM',
      'transactionType': 'buy'
    };
    try {
      return await _restClient.get(path, queryParams: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getPaymentSettings(int paymentTypeId) async {
    const path = 'v1/customer/payment-settings-per-type';
    final queryParams = <String, dynamic>{
      'countryCode': 'CM',
      'transactionType': 'buy',
      'paymentTypeId': '$paymentTypeId'
    };

    try {
      return await _restClient.get(path, queryParams: queryParams);
    } catch (e) {
      rethrow;
    }
  }
}

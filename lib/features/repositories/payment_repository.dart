import 'package:ejara_assignment/config/config.dart';
import 'package:ejara_assignment/services/rest_client.dart';

abstract class PaymentRepository {
  Future<Map<String, dynamic>> getPaymentMethods();
  Future<Map<String, dynamic>> getPaymentSettings(int paymentTypeId);
}

class PaymentRepositoryImpl implements PaymentRepository {
  final RestClient restClient;

  PaymentRepositoryImpl(this.restClient);

  @override
  Future<Map<String, dynamic>> getPaymentMethods() async {
    const path = '${Config.baseUrl2}/marketplace/payment-types-per-country';
    final queryParams = <String, dynamic>{
      'countryCode': 'CM',
      'transactionType': 'buy'
    };
    try {
      return await restClient.get(path, queryParams: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getPaymentSettings(int paymentTypeId) async {
    const path = '${Config.baseUrl}/customer/payment-settings-per-type';
    final queryParams = <String, dynamic>{
      'countryCode': 'CM',
      'transactionType': 'buy',
      'paymentTypeId': '$paymentTypeId'
    };

    try {
      return await restClient.get(path, queryParams: queryParams);
    } catch (e) {
      rethrow;
    }
  }
}

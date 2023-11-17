import 'package:ejara_assignment/features/models/payment/payment_type.dart';
import 'package:ejara_assignment/features/repositories/payment_repository.dart';
import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  final PaymentRepository paymentRepository;

  PaymentProvider(this.paymentRepository);

  Future<PaymentType> getPaymentMethods() async {
    final result = await paymentRepository.getPaymentMethods();
    return PaymentType.fromJson(result);
  }

  Future getPaymentSettings(int paymentTypeId) async {
    final result = await paymentRepository.getPaymentSettings(paymentTypeId);
    return result;
  }
}

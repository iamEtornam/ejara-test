import 'package:ejara_assignment/features/repositories/payment_repository.dart';
import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  final PaymentRepository paymentRepository;

  PaymentProvider(this.paymentRepository);

  Future getPaymentMethods() async {
    return await paymentRepository.getPaymentMethods();
  }

  Future getPaymentSettings(int paymentTypeId) async {
    return await paymentRepository.getPaymentSettings(paymentTypeId);
  }
}

import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:ejara_assignment/features/repositories/payment_repository.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

GetIt getIt = GetIt.instance;

class MockRestClient extends Mock implements RestClient {
}

class MockPaymentRepository extends Mock implements PaymentRepository {}

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

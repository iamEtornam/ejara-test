import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:ejara_assignment/features/repositories/payment_repository.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:ejara_assignment/util/local_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

GetIt getIt = GetIt.instance;

class MockRestClient extends Mock implements RestClient {}

class MockPaymentRepository extends Mock implements PaymentRepository {
  final RestClient restClient;

  MockPaymentRepository(this.restClient);
}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  final RestClient restClient;

  MockAuthenticationRepository(this.restClient);
}

class MockLocalStorage extends Mock implements LocalStorage {}

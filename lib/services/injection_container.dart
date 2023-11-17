import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
import 'package:ejara_assignment/features/repositories/authentication_repository.dart';
import 'package:ejara_assignment/features/repositories/payment_repository.dart';
import 'package:ejara_assignment/services/rest_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initFeatures() {
  /// Authentication feature
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  getIt.registerLazySingleton<AuthenticationProvider>(
      () => AuthenticationProvider(getIt.get()));

  /// Payment feature
  getIt.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl());
  getIt.registerLazySingleton<PaymentProvider>(
      () => PaymentProvider(getIt.get()));

  /// Rest Client
  getIt.registerLazySingleton<RestClient>(() => RestClientImpl());
}

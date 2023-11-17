import 'package:ejara_assignment/config/config.dart';
import 'package:ejara_assignment/features/models/payment/payment_type.dart';
import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
import 'package:ejara_assignment/router.dart';
import 'package:ejara_assignment/services/injection_container.dart' as inject;
import 'package:ejara_assignment/util/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../test/helper/core_mock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  inject.initFeatures();

  late AuthenticationProvider authProvider;
  late PaymentProvider paymentProvider;
  late LocalStorage localStorage;

  setUp(() {
    localStorage = MockLocalStorage();
    final mockAuthRepo = MockAuthenticationRepository();
    authProvider = AuthenticationProvider(mockAuthRepo, localStorage);
    final mockPaymentRepo = MockPaymentRepository();
    paymentProvider = PaymentProvider(mockPaymentRepo);
  });

  Widget rootWidget() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => authProvider,
        ),
        ChangeNotifierProvider<PaymentProvider>(
          create: (_) => paymentProvider,
        ),
      ],
      child: MaterialApp.router(
        title: Config.appName,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  testWidgets('tap on the payment methods should show bottom sheet',
      (tester) async {
    when(() => authProvider.login('username', 'password'))
        .thenReturn(Future.value(true));
    when(() => paymentProvider.getPaymentMethods())
        .thenReturn(Future.value(PaymentType.fromJson({
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
    })));

    const paymentTypeId = 1;

    when(() => paymentProvider.getPaymentSettings(paymentTypeId))
        .thenReturn(Future.value({
      "responseCode": "payment_settings_per_type_ok",
      "message": "get payment settings per type successful",
      "data": []
    }));

    // Load app widget.
    await tester.pumpWidget(rootWidget());

    expectSync(find.byKey(const Key('splash')), findsOneWidget);

    await tester.pump();

    // Tap on the payment methods button.
    final paymentScreen = find.byKey(const Key('payment-screen'));
    expectSync(paymentScreen, findsOneWidget);

    await tester.tap(find.byKey(const Key('payment-methods-0')));
    await tester.pump(const Duration(seconds: 3));

    expectSync(find.byType(BottomSheet), equals(findsOneWidget));

    await tester.tap(find.byKey(const Key('payment-method-1')));
    await tester.pump(const Duration(seconds: 3));

    await tester.tap(find.byKey(const Key('add-payment-method')));
    await tester.pump(const Duration(seconds: 3));

    final addPaymentScreen = find.byKey(const Key('add-payment-screen'));
    expectSync(addPaymentScreen, findsOneWidget);

    await tester.pump(const Duration(seconds: 3));

    final operatorTextField = find.byKey(const Key('mobile-operator'));
    expectSync(operatorTextField, findsOneWidget);
    await tester.enterText(operatorTextField, 'MTN');

    await tester.pump(const Duration(seconds: 3));

    final phonenumberTextField = find.byKey(const Key('phone-number'));
    expectSync(phonenumberTextField, findsOneWidget);
    await tester.enterText(phonenumberTextField, '9 96 000 043');

    await tester.pump(const Duration(seconds: 3));

    final fullnameTextField = find.byKey(const Key('full-name'));
    expectSync(fullnameTextField, findsOneWidget);
    await tester.enterText(fullnameTextField, 'John Doe');

    await tester.pump(const Duration(seconds: 3));

    await tester.pump();

    // Trigger a frame.
    await tester.pumpAndSettle();
  });
}

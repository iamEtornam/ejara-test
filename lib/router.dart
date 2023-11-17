import 'package:ejara_assignment/extensions/extension.dart';
import 'package:ejara_assignment/ui/payment/add_payment_method_view.dart';
import 'package:ejara_assignment/ui/payment/payment_method_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/models/user/user.dart';
import 'ui/intro/splash_view.dart';

class RoutesName {
  static const ({String path, String name}) initialRoute =
      (path: '/', name: '/');
  static const ({String path, String name}) paymentRoute =
      (path: 'payment-methods', name: 'payment-methods');
  static const ({String path, String name}) addMethodRoute =
      (path: 'new-methods', name: 'new-methods');
}

final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: RoutesName.initialRoute.path,
    routes: <GoRoute>[
      GoRoute(
          path: RoutesName.initialRoute.path,
          name: RoutesName.initialRoute.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const SplashView().pageTransition(state: state);
          },
          routes: [
            GoRoute(
                path: RoutesName.paymentRoute.path,
                name: RoutesName.paymentRoute.name,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  final user = state.extra as User?;
                  return PaymentMethodView(
                    user: user,
                  ).pageTransition(state: state);
                },
                routes: [
                  GoRoute(
                    path: RoutesName.addMethodRoute.path,
                    name: RoutesName.addMethodRoute.name,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return const AddPaymentMethodView()
                          .pageTransition(state: state);
                    },
                  )
                ])
          ])
    ]);

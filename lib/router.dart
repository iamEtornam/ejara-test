import 'package:ejara_assignment/extensions/extension.dart';
import 'package:ejara_assignment/ui/payment_method_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'splash_view.dart';

class RoutesName {
  static const ({String path, String name}) initialRoute =
      (path: '/', name: '/');
  static const ({String path, String name}) paymentRoute =
      (path: 'payment-methods', name: 'payment-methods');
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
                return PaymentMethodView().pageTransition(state: state);
              },
            )
          ])
    ]);

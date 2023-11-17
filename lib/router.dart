import 'package:ejara_assignment/extensions/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'splash_view.dart';

class RoutesName {
  static const ({String path, String name}) initialRoute =
      (path: '/', name: '/');
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
      )
    ]);

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension PostFrameCallback on VoidCallback {
  void withPostFrameCallback() =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        this();
      });
}

extension PageTransition on Widget {
  pageTransition({required GoRouterState state}) {
    if (kIsWeb || Platform.isMacOS) {
      return CustomTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    } else {
      return MaterialPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
    }
  }
}

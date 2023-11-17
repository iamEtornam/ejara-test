import 'package:ejara_assignment/router.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';
import 'util/color_schemes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Config.appName,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
    );
  }
}
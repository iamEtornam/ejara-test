import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
import 'package:ejara_assignment/router.dart';
import 'package:ejara_assignment/services/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'util/color_schemes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => getIt.get<AuthenticationProvider>(),
        ),
        ChangeNotifierProvider<PaymentProvider>(
          create: (_) => getIt.get<PaymentProvider>(),
        ),
      ],
      child: MaterialApp.router(
        title: Config.appName,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ),
    );
  }
}

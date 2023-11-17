import 'package:bot_toast/bot_toast.dart';
import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
import 'package:ejara_assignment/router.dart';
import 'package:ejara_assignment/services/injection_container.dart';
import 'package:ejara_assignment/widgets/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';

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
        builder: BotToastInit(),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: customLightTheme(context),
      ),
    );
  }
}

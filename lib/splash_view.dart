import 'package:ejara_assignment/extensions/extension.dart';
import 'package:ejara_assignment/features/providers/authentication_provider.dart';
import 'package:ejara_assignment/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    () async {
      final success = await authProvider.login('ejaraTests', 'CmKVGexi%REJjn!u65BI7PlR5');
      if (!mounted) return;
      if (success) {
        context.goNamed(RoutesName.paymentRoute.name);
      }
    }.withPostFrameCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const SizedBox(
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

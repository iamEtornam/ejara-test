import 'package:ejara_assignment/util/color_schemes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData customLightTheme(
  BuildContext context,
) {
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),
      platform: defaultTargetPlatform,
      highlightColor: Colors.black.withOpacity(.5),
      primaryColor: Colors.black,
      indicatorColor: Colors.black,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.black),
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      cardColor: const Color(0xFFF5F5F5),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(unselectedItemColor: Colors.grey),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.normal,
            ),
        contentPadding: const EdgeInsets.all(15.0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: .3),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: .3),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: .3),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0xFFB00020).withOpacity(.5), width: .3),
            borderRadius: const BorderRadius.all(Radius.circular(13))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB00020), width: .3),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: const Color(0xFFB00020)),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black.withOpacity(.5),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyLarge: const TextStyle(color: Colors.black),
            bodyMedium: const TextStyle(color: Colors.black),
            bodySmall: const TextStyle(
              color: Colors.black,
            ),
            displayLarge: const TextStyle(
              color: Colors.black,
            ),
            displayMedium: const TextStyle(color: Colors.black),
            displaySmall: const TextStyle(color: Colors.black),
            headlineMedium: const TextStyle(color: Colors.black),
            headlineSmall: const TextStyle(color: Colors.black),
            titleLarge: const TextStyle(color: Colors.black),
            titleMedium: const TextStyle(color: Colors.black),
            titleSmall: const TextStyle(color: Colors.black),
            labelSmall: const TextStyle(color: Colors.black),
            labelLarge: const TextStyle(color: Colors.black),
          ),
      dividerColor: Colors.grey.shade300,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )),
      colorScheme: lightColorScheme.copyWith(error: const Color(0xFFB00020)));
}

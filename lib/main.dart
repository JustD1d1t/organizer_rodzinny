import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organizer_rodzinny/screens/auth/auth_screen.dart';
import 'package:organizer_rodzinny/screens/auth/splash_screen.dart';
import 'package:organizer_rodzinny/screens/main_screen.dart';
import "package:organizer_rodzinny/theme_config.dart";

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData.from(
      colorScheme: schemeLight,
    ).copyWith(
      textTheme: themeConfig["textTheme"],
      appBarTheme: themeConfig["appBarTheme"],
    ),
    darkTheme: ThemeData.from(
      colorScheme: schemeDark,
    ).copyWith(
      textTheme: themeConfig["textTheme"],
      appBarTheme: themeConfig["appBarTheme"],
    ),
    // home: const MainScreen(),
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        if (snapshot.hasData) {
          return const MainScreen();
        }

        return const AuthScreen();
      },
    ),
  ));
}

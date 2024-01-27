import 'package:flutter/material.dart';
import 'package:organizer_rodzinny/screens/main_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 65, 26, 71),
);

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: kColorScheme,
      primaryColor: kColorScheme.primary,
      textTheme: const TextTheme().copyWith(
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: kColorScheme.onSecondaryContainer,
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: kColorScheme.onPrimaryContainer,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: kColorScheme.onPrimaryContainer,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: kColorScheme.onPrimaryContainer,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: kColorScheme.onPrimaryContainer,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: kColorScheme.onPrimaryContainer,
        ),
      ),
      // cardTheme: CardTheme(
      //   color: kColorScheme.primaryContainer,
      //   elevation: 4,
      //   margin: const EdgeInsets.all(8),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: kColorScheme.primaryContainer,
      //     foregroundColor: kColorScheme.onPrimaryContainer,
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 16,
      //       vertical: 8,
      //     ),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //   ),
      // ),
    ),
    home: const MainScreen(),
  ));
}

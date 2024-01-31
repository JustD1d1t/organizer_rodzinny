import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import "package:flutter/material.dart";
import 'package:flutter/scheduler.dart';

const Color primarySeedColor = Color(0xFF6750A4);
const Color secondarySeedColor = Color(0xFF3871BB);
const Color tertiarySeedColor = Color(0xFF6CA450);

final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
  tones: FlexTones.vivid(Brightness.light),
);

final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
  tones: FlexTones.vivid(Brightness.dark),
);

final isDarkMode =
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;

final Map<String, dynamic> themeConfig = {
  "textTheme": TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? schemeDark.primary : schemeLight.primary,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? schemeDark.primary : schemeLight.primary,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? schemeDark.primary : schemeLight.primary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: isDarkMode ? schemeDark.primary : schemeLight.primary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: isDarkMode ? schemeDark.primary : schemeLight.primary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: isDarkMode ? schemeDark.primary : schemeLight.primary,
    ),
  ),
  "appBarTheme": AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? schemeDark.primary : schemeLight.onPrimaryContainer,
    ),
  ),
};

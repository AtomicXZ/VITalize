import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Colors.blue;

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: seedColor,
  brightness: Brightness.light,
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: seedColor,
  brightness: Brightness.dark,
);

final customLightBackgroundColor = Color.lerp(
    kColorSchemeLight.primaryContainer, kColorSchemeLight.background, 0.4);

final customDarkBackgroundColor = Color.lerp(
    kColorSchemeDark.background, kColorSchemeDark.primaryContainer, 0.4);

TextTheme getTextTheme(Color textColor) {
  return GoogleFonts.openSansTextTheme().apply(
    bodyColor: textColor,
    displayColor: textColor,
    decorationColor: textColor,
  );
}

TextTheme lightTextTheme = getTextTheme(Colors.black);
TextTheme darkTextTheme = getTextTheme(Colors.white);

final lightTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorSchemeLight,
  scaffoldBackgroundColor: customLightBackgroundColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: lightTextTheme.displayLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    backgroundColor: customLightBackgroundColor,
    scrolledUnderElevation: 0,
  ),
  textTheme: lightTextTheme,
);

final darkTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorSchemeDark,
  scaffoldBackgroundColor: customDarkBackgroundColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: darkTextTheme.displayLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    backgroundColor: customDarkBackgroundColor,
    scrolledUnderElevation: 0,
  ),
  textTheme: darkTextTheme,
);

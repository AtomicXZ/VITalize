import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: Colors.lightGreenAccent,
  brightness: Brightness.light,
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: Colors.greenAccent,
  brightness: Brightness.dark,
);

final kCustomLightBackgroundColor = Color.lerp(
    kColorSchemeLight.primaryContainer, kColorSchemeLight.background, 0.4);

final kCustomDarkBackgroundColor = kColorSchemeDark.background;

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
  scaffoldBackgroundColor: kCustomLightBackgroundColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: lightTextTheme.displayLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    backgroundColor: kCustomLightBackgroundColor,
    scrolledUnderElevation: 0,
  ),
  textTheme: lightTextTheme,
);

final darkTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorSchemeDark,
  scaffoldBackgroundColor: kCustomDarkBackgroundColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: darkTextTheme.displayLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    backgroundColor: kCustomDarkBackgroundColor,
    scrolledUnderElevation: 0,
  ),
  textTheme: darkTextTheme,
);

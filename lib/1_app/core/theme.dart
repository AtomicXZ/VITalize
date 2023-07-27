import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

final kThemeColor = Colors.lightGreenAccent;

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: kThemeColor,
  brightness: Brightness.light,
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: kThemeColor,
  brightness: Brightness.dark,
);

final kCustomLightBackgroundColor =
    lighten(kColorSchemeLight.primaryContainer, 80);

final kCustomDarkBackgroundColor =
    darken(kColorSchemeDark.primaryContainer, 80);

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

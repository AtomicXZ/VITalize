import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: Colors.deepPurpleAccent,
  brightness: Brightness.light,
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: Colors.deepPurpleAccent,
  brightness: Brightness.dark,
);

final textTheme = GoogleFonts.openSansTextTheme().copyWith(
  displayLarge: const TextStyle(
    fontSize: 34.0,
    color: Colors.black,
  ),
  displayMedium: const TextStyle(
    fontSize: 24.0,
    color: Colors.black,
  ),
  displaySmall: const TextStyle(
    fontSize: 20.0,
    color: Colors.black,
  ),
  bodyLarge: const TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  ),
  bodyMedium: const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  ),
  bodySmall: const TextStyle(
    fontSize: 12.0,
    color: Colors.black,
  ),
  titleMedium: const TextStyle(
    fontSize: 20.0,
    color: Colors.black,
  ),
  titleSmall: const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
  ),
  labelLarge: const TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  ),
  labelSmall: const TextStyle(
    fontSize: 12.0,
    color: Colors.black,
  ),
);

final lightTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorSchemeLight,
  scaffoldBackgroundColor: kColorSchemeLight.background,
  appBarTheme: AppBarTheme(
    titleTextStyle: textTheme.displayMedium!.copyWith(
      color: Colors.black,
    ),
    elevation: 0,
  ),
  textTheme: textTheme,
);

final darkTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorSchemeDark,
  scaffoldBackgroundColor: kColorSchemeDark.background,
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.openSans().copyWith(
      color: Colors.white,
      fontSize: 22,
    ),
  ),
  textTheme: textTheme,
);

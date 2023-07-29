import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeGenerator {
  static Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }

  static Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round(),
    );
  }

  static ThemeData generateThemeData(Color themeColor, {bool isLight = true}) {
    final kColorScheme = ColorScheme.fromSeed(
      seedColor: themeColor,
      brightness: isLight ? Brightness.light : Brightness.dark,
    );

    final kCustomBackgroundColor = isLight
        ? lighten(kColorScheme.primaryContainer, 80)
        : darken(kColorScheme.primaryContainer, 80);

    TextTheme getTextTheme(Color textColor) {
      return GoogleFonts.openSansTextTheme().apply(
        bodyColor: textColor,
        displayColor: textColor,
        decorationColor: textColor,
      );
    }

    TextTheme textTheme = getTextTheme(isLight ? Colors.black : Colors.white);

    return isLight
        ? ThemeData.light().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            scaffoldBackgroundColor: kCustomBackgroundColor,
            appBarTheme: AppBarTheme(
              titleTextStyle: textTheme.titleLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: kCustomBackgroundColor,
              shadowColor: Colors.transparent,
            ),
            textTheme: textTheme,
          )
        : ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            scaffoldBackgroundColor: kCustomBackgroundColor,
            appBarTheme: AppBarTheme(
              titleTextStyle: textTheme.titleLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: kCustomBackgroundColor,
              shadowColor: Colors.transparent,
            ),
            textTheme: textTheme,
          );
  }
}

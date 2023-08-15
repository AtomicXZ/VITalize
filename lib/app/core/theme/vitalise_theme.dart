import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_color.dart';

const Color primaryColor = Color(0xFF795548);
const String fontPreference = 'Lato';

ElevatedButtonThemeData elevatedButtonTheme(
  BuildContext context,
  ColorScheme colorScheme,
) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primaryContainer,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: colorScheme.onPrimary,
      ),
    ),
  );
}

InputDecorationTheme get inputDecorationTheme {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    filled: true,
  );
}

NavigationBarThemeData navigationBarThemeData(
  ColorScheme colorScheme,
  TextTheme? textTheme,
) {
  return NavigationBarThemeData(
    backgroundColor: colorScheme.surface,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return textTheme?.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        );
      } else {
        return textTheme?.bodyLarge?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.75),
        );
      }
    }),
  );
}

NavigationDrawerThemeData navigationDrawerThemeData(
  ColorScheme colorScheme,
  TextTheme? textTheme,
) {
  return NavigationDrawerThemeData(
    backgroundColor: colorScheme.surface,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return textTheme?.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
        );
      } else {
        return textTheme?.bodyLarge;
      }
    }),
  );
}

DrawerThemeData drawerThemeData(
  ColorScheme colorScheme,
  TextTheme? textTheme,
) {
  return DrawerThemeData(
    backgroundColor: colorScheme.surface,
  );
}

FloatingActionButtonThemeData floatingActionButton(ColorScheme colorScheme) {
  return FloatingActionButtonThemeData(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
  );
}

AppBarTheme appBarThemeLight(ColorScheme colorScheme) {
  return AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: lighten(colorScheme.primaryContainer),
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
}

AppBarTheme appBarThemeDark(ColorScheme colorScheme) {
  return AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
}

DialogTheme get dialogTheme {
  return DialogTheme(
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );
}

TimePickerThemeData get timePickerTheme {
  return TimePickerThemeData(
    helpTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    hourMinuteTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    hourMinuteShape: const CircleBorder(),
  );
}

Color lighten(Color c, [int percent = 80]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

CustomColors lightCustomColor = CustomColors(
  red: Colors.red.shade400,
  green: Colors.green.shade400,
  blue: Colors.blue.shade400,
);
CustomColors darkCustomColor = CustomColors(
  red: Colors.red.shade400,
  green: Colors.green.shade400,
  blue: Colors.blue.shade400,
);

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitalize/app/core/routes/routes.dart';
import 'package:vitalize/app/core/theme/vitalise_theme.dart';
import 'package:vitalize/app/core/utils/hive_user_box_utils.dart';
import 'package:vitalize/data/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable:
          Hive.box<String>(userBoxName).listenable(keys: listenableKeys),
      builder: (context, box, widget) => DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;
        if (lightDynamic != null &&
            darkDynamic != null &&
            isTrue(dynamicTheme)) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: primaryColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.dark,
          );
        }
        final lightTextTheme = GoogleFonts.getTextTheme(
          fontPreference,
          ThemeData.light().textTheme,
        );
        final darkTextTheme = GoogleFonts.getTextTheme(
          fontPreference,
          ThemeData.dark().textTheme,
        );
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.from(
            colorScheme: lightColorScheme,
          ).copyWith(
            textTheme: lightTextTheme,
            colorScheme: lightColorScheme,
            dialogTheme: dialogTheme,
            timePickerTheme: timePickerTheme,
            appBarTheme: appBarThemeLight(lightColorScheme),
            useMaterial3: true,
            scaffoldBackgroundColor: lighten(lightColorScheme.primaryContainer),
            dialogBackgroundColor: lightColorScheme.background,
            navigationBarTheme: navigationBarThemeData(
              lightColorScheme,
              lightTextTheme,
            ),
            navigationDrawerTheme: navigationDrawerThemeData(
              lightColorScheme,
              lightTextTheme,
            ),
            drawerTheme: drawerThemeData(
              lightColorScheme,
              lightTextTheme,
            ),
            applyElevationOverlayColor: true,
            inputDecorationTheme: inputDecorationTheme,
            elevatedButtonTheme: elevatedButtonTheme(
              context,
              lightColorScheme,
            ),
            extensions: [lightCustomColor],
            dividerTheme: DividerThemeData(
              color: ThemeData.light().dividerColor,
            ),
          ),
          darkTheme: ThemeData.from(
            colorScheme: darkColorScheme,
          ).copyWith(
            textTheme: darkTextTheme,
            colorScheme: darkColorScheme,
            dialogTheme: dialogTheme,
            timePickerTheme: timePickerTheme,
            appBarTheme: appBarThemeDark(darkColorScheme),
            useMaterial3: true,
            scaffoldBackgroundColor: darkColorScheme.background,
            dialogBackgroundColor: darkColorScheme.background,
            navigationBarTheme: navigationBarThemeData(
              darkColorScheme,
              darkTextTheme,
            ),
            navigationDrawerTheme: navigationDrawerThemeData(
              darkColorScheme,
              darkTextTheme,
            ),
            drawerTheme: drawerThemeData(
              darkColorScheme,
              darkTextTheme,
            ),
            applyElevationOverlayColor: true,
            inputDecorationTheme: inputDecorationTheme,
            elevatedButtonTheme: elevatedButtonTheme(
              context,
              darkColorScheme,
            ),
            extensions: [darkCustomColor],
            dividerTheme: DividerThemeData(
              color: ThemeData.dark().dividerColor,
            ),
          ),
          title: 'VITalize',
          routerConfig: routes,
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import '1_app/core/routes/routes.dart';
import '1_app/core/theme.dart';

void main() async {
  await Hive.initFlutter();
  registerAllAdapters();
  await openAllBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeGenerator.generateThemeData(Colors.lightGreenAccent),
      darkTheme: ThemeGenerator.generateThemeData(Colors.lightGreenAccent,
          isLight: false),
      title: 'VITalize',
      routerConfig: routes,
    );
  }
}

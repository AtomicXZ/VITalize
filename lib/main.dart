import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vtop_app/1_app/core/routes/routes.dart';
import 'package:vtop_app/1_app/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Vtop AP-p',
      routerConfig: routes,
    );
  }
}

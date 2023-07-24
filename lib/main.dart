import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vtop_app/0_data/models/attendance.dart';
import 'package:vtop_app/1_app/core/utils/is_first_launch.dart';

import '0_data/models/period.dart';
import '1_app/core/routes/routes.dart';
import '1_app/core/theme.dart';
import '1_app/core/utils/cache_all_data.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('userBox');
  Hive.registerAdapter(PeriodAdapter());
  Hive.registerAdapter(AttendanceAdapter());
  if (!isFirstLaunch) {
    await cacheAllData();
  }
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

import 'package:flutter/material.dart';

import 'package:vtop_app/1_app/pages/attendance_page/attendance_page.dart';
import 'package:vtop_app/1_app/pages/exam_schedule_page/exam_schedule_page.dart';
import 'package:vtop_app/1_app/pages/home_page/homepage.dart';
import 'package:vtop_app/1_app/pages/login_page/login_page.dart';
import 'package:vtop_app/1_app/pages/marks_page/marks_page.dart';
import 'package:vtop_app/1_app/pages/profile_page/profile_page.dart';
import 'package:vtop_app/1_app/pages/time_table_page/timetable_page.dart';

class GoRouterConfig {
  final IconData? icon;
  final IconData? selectedIcon;
  final String name;
  final Widget child;

  GoRouterConfig({
    required this.name,
    this.icon,
    this.selectedIcon,
    Widget? child,
  }) : child = child ?? const Placeholder();
}

final List<GoRouterConfig> allNavBarConfigs = [
  homePageConfig,
  attendancePageConfig,
  marksPageConfig,
  examSchedulePageConfig,
  profilePageConfig,
];

final loginPageConfig = GoRouterConfig(
  name: 'Login',
  child: const LoginPageProvider(),
);
final homePageConfig = GoRouterConfig(
  icon: Icons.home_outlined,
  selectedIcon: Icons.home_rounded,
  name: 'Home',
  child: const HomePageProvider(),
);
final attendancePageConfig = GoRouterConfig(
  icon: Icons.bookmark_border_rounded,
  selectedIcon: Icons.bookmark,
  name: 'Attendance',
  child: const AttendancePageProvider(),
);
final marksPageConfig = GoRouterConfig(
  icon: Icons.calculate_outlined,
  selectedIcon: Icons.calculate_rounded,
  name: 'Marks',
  child: const MarksPageProvider(),
);
final examSchedulePageConfig = GoRouterConfig(
    icon: Icons.calendar_today_outlined,
    selectedIcon: Icons.calendar_today_rounded,
    name: 'Exam',
    child: const ExamSchedulePageProvider());
final profilePageConfig = GoRouterConfig(
  icon: Icons.person_outline_rounded,
  selectedIcon: Icons.person_rounded,
  name: 'Profile',
  child: const ProfilePageProvider(),
);
final timetablePageConfig = GoRouterConfig(
  name: 'Timetable',
  child: const TimetablePageProvider(),
);

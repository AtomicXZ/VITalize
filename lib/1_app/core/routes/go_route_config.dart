import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
  icon: FluentIcons.home_24_regular,
  selectedIcon: FluentIcons.home_24_filled,
  name: 'Home',
  child: const HomePageProvider(),
);
final attendancePageConfig = GoRouterConfig(
  icon: FluentIcons.bookmark_24_regular,
  selectedIcon: FluentIcons.bookmark_24_filled,
  name: 'Attendance',
  child: const AttendancePageProvider(),
);
final marksPageConfig = GoRouterConfig(
  icon: FluentIcons.number_symbol_24_regular,
  selectedIcon: FluentIcons.number_symbol_24_filled,
  name: 'Marks',
  child: const MarksPageProvider(),
);
final examSchedulePageConfig = GoRouterConfig(
    icon: FluentIcons.calendar_24_regular,
    selectedIcon: FluentIcons.calendar_24_filled,
    name: 'Exam',
    child: const ExamSchedulePageProvider());
final profilePageConfig = GoRouterConfig(
  icon: FluentIcons.person_24_regular,
  selectedIcon: FluentIcons.person_24_filled,
  name: 'Profile',
  child: const ProfilePageProvider(),
);
final timetablePageConfig = GoRouterConfig(
  name: 'Timetable',
  child: const TimetablePageProvider(),
);

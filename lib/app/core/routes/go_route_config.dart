import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:vitalize/app/pages/attendance_page/attendance_page.dart';
import 'package:vitalize/app/pages/exam_schedule_page/exam_schedule_page.dart';
import 'package:vitalize/app/pages/home_page/homepage.dart';
import 'package:vitalize/app/pages/login_page/login_page.dart';
import 'package:vitalize/app/pages/marks_page/marks_page.dart';
import 'package:vitalize/app/pages/others_page/others_page.dart';
import 'package:vitalize/app/pages/profile_page/profile_page.dart';
import 'package:vitalize/app/pages/time_table_page/timetable_page.dart';

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
  othersPageConfig,
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
    name: 'ExamSchedule',
    child: const ExamSchedulePageProvider());
final profilePageConfig = GoRouterConfig(
  icon: FluentIcons.person_24_regular,
  selectedIcon: FluentIcons.person_24_filled,
  name: 'Profile',
  child: const ProfilePageProvider(),
);
final othersPageConfig = GoRouterConfig(
  icon: FluentIcons.more_circle_24_regular,
  selectedIcon: FluentIcons.more_circle_24_filled,
  name: 'Others',
  child: const OthersPage(),
);
final timetablePageConfig = GoRouterConfig(
  icon: FluentIcons.clock_24_regular,
  selectedIcon: FluentIcons.clock_24_filled,
  name: 'Timetable',
  child: const TimetablePageProvider(),
);

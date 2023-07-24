import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/1_app/core/utils/is_first_launch.dart';

import 'go_route_config.dart';
import '../widgets/scaffold_with_navbar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const _root = '/home';

String get initialLocation {
  if (isFirstLaunch) {
    return loginPageConfig.name;
  } else {
    return homePageConfig.name;
  }
}

final routes = GoRouter(
  initialLocation: '$_root/$initialLocation',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: homePageConfig.name,
          path: '$_root/${homePageConfig.name}',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ScaffoldWithNavbar(page: homePageConfig)),
        ),
        GoRoute(
          name: attendancePageConfig.name,
          path: '$_root/${attendancePageConfig.name}',
          pageBuilder: (context, state) => NoTransitionPage(
              child: ScaffoldWithNavbar(page: attendancePageConfig)),
        ),
        GoRoute(
          name: marksPageConfig.name,
          path: '$_root/${marksPageConfig.name}',
          pageBuilder: (context, state) => NoTransitionPage(
              child: ScaffoldWithNavbar(page: marksPageConfig)),
        ),
        GoRoute(
          name: profilePageConfig.name,
          path: '$_root/${profilePageConfig.name}',
          pageBuilder: (context, state) => NoTransitionPage(
              child: ScaffoldWithNavbar(page: profilePageConfig)),
        ),
      ],
    ),
    GoRoute(
      name: timetablePageConfig.name,
      path: '$_root/${timetablePageConfig.name}',
      builder: (context, state) => timetablePageConfig.child,
    ),
    GoRoute(
      name: loginPageConfig.name,
      path: '$_root/${loginPageConfig.name}',
      builder: (context, state) => loginPageConfig.child,
    ),
  ],
);

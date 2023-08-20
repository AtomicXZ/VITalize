import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';
import 'package:vitalize/app/core/utils/is_first_launch.dart';
import 'package:vitalize/app/core/widgets/scaffold_with_appbar.dart';
import 'package:vitalize/app/core/widgets/scaffold_with_navbar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellHomePageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'HomePage');

final GlobalKey<NavigatorState> _shellAttendancePageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'AttendancePage');

final GlobalKey<NavigatorState> _shellMarksPageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'MarksPage');

final GlobalKey<NavigatorState> _shellOthersPageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'OthersPage');

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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellHomePageNavigatorKey,
          routes: [
            GoRoute(
              name: homePageConfig.name,
              path: '$_root/${homePageConfig.name}',
              builder: (BuildContext context, GoRouterState state) =>
                  homePageConfig.child,
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellAttendancePageNavigatorKey,
          routes: [
            GoRoute(
              path: '$_root/${attendancePageConfig.name}',
              builder: (BuildContext context, GoRouterState state) =>
                  attendancePageConfig.child,
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellMarksPageNavigatorKey,
          routes: [
            GoRoute(
              path: '$_root/${marksPageConfig.name}',
              builder: (BuildContext context, GoRouterState state) =>
                  marksPageConfig.child,
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellOthersPageNavigatorKey,
          routes: [
            GoRoute(
              path: '$_root/${othersPageConfig.name}',
              builder: (BuildContext context, GoRouterState state) =>
                  othersPageConfig.child,
              routes: [
                GoRoute(
                  name: examSchedulePageConfig.name,
                  path: examSchedulePageConfig.name,
                  builder: (context, state) => ScaffoldWithAppbar(
                    page: examSchedulePageConfig,
                    title: 'Exam Schedule',
                  ),
                ),
                GoRoute(
                  name: profilePageConfig.name,
                  path: profilePageConfig.name,
                  builder: (context, state) =>
                      ScaffoldWithAppbar(page: profilePageConfig),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: timetablePageConfig.name,
      path: '$_root/${timetablePageConfig.name}',
      builder: (context, state) =>
          ScaffoldWithAppbar(page: timetablePageConfig),
    ),
    GoRoute(
      name: loginPageConfig.name,
      path: '$_root/${loginPageConfig.name}',
      builder: (context, state) => loginPageConfig.child,
    ),
  ],
);

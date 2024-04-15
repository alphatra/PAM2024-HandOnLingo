import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handsonling/screens/home_screen.dart';
import 'package:handsonling/screens/course_screen.dart';
import 'package:handsonling/screens/settings_screen.dart';

import 'package:handsonling/widgets/bottom_nav_bar.dart';

abstract class PageName {
  static const homeRoute = '/';
  static const courseRoute = '/course';
  static const settingsRoute = '/settings';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: BottomNavBar(child: child));
      },
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(child: const HomeScreen()),
        ),
        GoRoute(
          path: '/course',
          parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => NoTransitionPage(child: const CourseScreen())
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => NoTransitionPage(child: const SettingsScreen())
        ),
      ],
    )
  ],
);

Page getPage(Widget child, GoRouterState state) {
  return MaterialPage(key: state.pageKey, child: child);
}
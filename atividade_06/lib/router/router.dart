import 'package:atividade_06/router/bottom_navigation_bar.dart';
import 'package:atividade_06/gallery/gallery_page.dart';
import 'package:atividade_06/text/text_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BottomNavigationBarScaffold(
        child: child
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/',
          builder: (context, state) => const TextPage(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/gallery',
          builder: (context, state) => const GalleryPage(),
        )
      ]
    )
  ],
);
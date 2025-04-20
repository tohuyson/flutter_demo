import 'package:flutter_demo/features/home/home_page.dart';
import 'package:flutter_demo/features/maps/live_tracking_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

enum AppRoute { home, maps }

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    // redirect: (context, state) {
    //   return '/';
    // },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: AppRoute.maps.name,
            name: AppRoute.maps.name,
            builder: (context, state) => const LiveTrackingPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const SizedBox(),
  );
});

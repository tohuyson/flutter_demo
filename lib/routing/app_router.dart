import 'package:flutter_demo/constants/app_data.dart';
import 'package:flutter_demo/features/clock/presentation/screens/clock_page.dart';
import 'package:flutter_demo/features/email/presentation/screens/email_screen.dart';
import 'package:flutter_demo/features/grocery/details/presentation/grocery_details_screen.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/grocery_home_screen.dart';
import 'package:flutter_demo/features/home/presentation/screens/home_page.dart';
import 'package:flutter_demo/features/isolate_loading/presentation/screens/isolae_loading_screen.dart';
import 'package:flutter_demo/features/maps/presentation/live_tracking_page.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

enum AppRoute { home, maps, grocery, groceryDetails, clock, email, isolateLoading }

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
          GoRoute(
            path: AppRoute.grocery.name,
            name: AppRoute.grocery.name,
            builder: (context, state) => const GroceryHomeScreen(),
          ),
          GoRoute(
            path: AppRoute.groceryDetails.name,
            name: AppRoute.groceryDetails.name,
            pageBuilder:
                (context, state) => CustomTransitionPage<void>(
                  key: state.pageKey,
                  transitionDuration: AppData.instance.panelTransition,
                  reverseTransitionDuration: AppData.instance.panelTransition,
                  child: GroceryDetailsScreen(product: state.extra as GroceryProduct),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
          ),
          GoRoute(path: AppRoute.clock.name, name: AppRoute.clock.name, builder: (context, state) => const ClockPage()),
          GoRoute(
            path: AppRoute.email.name,
            name: AppRoute.email.name,
            builder: (context, state) => const EmailScreen(),
          ),
          GoRoute(
            path: AppRoute.isolateLoading.name,
            name: AppRoute.isolateLoading.name,
            builder: (context, state) => const IsolateLoadingScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const SizedBox(),
  );
});

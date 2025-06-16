import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/constants/app_theme.dart';
import 'package:flutter_demo/features/clock/presentation/providers/clock_provider.dart';
import 'package:flutter_demo/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppSize.instance.init(context);
    final goRouter = ref.watch(goRouterProvider);
    final appTheme = ref.watch(clockStateNotifier);
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      restorationScopeId: 'app',
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColor.instance.primaryColorLight),
      //   useMaterial3: true,
      // ),
      theme: AppTheme.instance.themeData(context),
      darkTheme: AppTheme.instance.darkThemeData(context),
      themeMode: appTheme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
    );
  }
}

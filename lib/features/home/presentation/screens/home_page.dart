import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: AppSize.instance.defaultPadding,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.maps.name);
              },
              child: const Text('Maps Page'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.grocery.name);
              },
              child: const Text('Grocery Page'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.clock.name);
              },
              child: const Text('Clock Page'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.email.name);
              },
              child: const Text('Email Page'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.isolateLoading.name);
              },
              child: const Text('Isolate Loading Page'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRoute.computeLoading.name);
              },
              child: const Text('Compute Loading Page'),
            ),
          ],
        ),
      ),
    );
  }
}

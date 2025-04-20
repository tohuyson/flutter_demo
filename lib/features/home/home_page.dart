import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.goNamed(
                //   AppRoute.maps.name,
                // );
                GoRouter.of(context).pushNamed(AppRoute.maps.name);
              },
              child: const Text('Maps Page'),
            ),
          ],
        ),
      ),
    );
  }
}

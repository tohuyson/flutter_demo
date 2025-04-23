import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/di/get_it.dart';
import 'package:flutter_demo/features/app_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initSingletons();
  provideDataSources();
  provideRepositories();
  provideUseCases();
  runApp(const ProviderScope(child: AppView()));
}

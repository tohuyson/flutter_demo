import 'package:flutter/material.dart';
import 'package:flutter_demo/features/app_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: AppView()));
}

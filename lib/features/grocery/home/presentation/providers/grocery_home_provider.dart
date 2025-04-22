import 'package:flutter_demo/features/grocery/home/presentation/providers/state/grocery_home_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groceryHomeStateNotifier = StateNotifierProvider.autoDispose<GroceryHomeNotifier, GroceryHomeState>((ref) {
  return GroceryHomeNotifier();
});

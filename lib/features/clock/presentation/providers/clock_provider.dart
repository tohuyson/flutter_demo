import 'package:flutter_demo/features/clock/presentation/providers/state/clock_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clockStateNotifier = StateNotifierProvider.autoDispose<ClockNotifier, ClockState>((ref) {
  return ClockNotifier();
});

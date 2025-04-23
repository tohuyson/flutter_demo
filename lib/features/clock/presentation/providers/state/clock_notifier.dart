import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'clock_state.dart';

class ClockNotifier extends StateNotifier<ClockState> {
  ClockNotifier() : super(const ClockState());

  changeThemeState() {
    state = state.copyWith(isLightTheme: !state.isLightTheme);
  }
}

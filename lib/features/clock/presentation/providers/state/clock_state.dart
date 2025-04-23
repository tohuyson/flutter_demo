part of 'clock_notifier.dart';

class ClockState extends Equatable {
  final bool isLightTheme;

  const ClockState({this.isLightTheme = true});

  ClockState copyWith({bool? isLightTheme}) {
    return ClockState(isLightTheme: isLightTheme ?? this.isLightTheme);
  }

  @override
  List<Object?> get props => [isLightTheme];
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/clock/presentation/providers/clock_provider.dart';
import 'package:flutter_demo/features/clock/presentation/screens/components/clock_paint.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Clock extends ConsumerStatefulWidget {
  const Clock({super.key});

  @override
  ConsumerState<Clock> createState() => _ClockState();
}

class _ClockState extends ConsumerState<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(clockStateNotifier);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.instance.getProportionateScreenWidth(20)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.instance.kClockShadowColor.withValues(alpha: 0.14),
                    blurRadius: 64,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(painter: ClockPainter(context: context, dateTime: _dateTime)),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              ref.read(clockStateNotifier.notifier).changeThemeState();
            },
            child: SvgPicture.asset(
              state.isLightTheme ? "assets/images/Sun.svg" : "assets/images/Moon.svg",
              height: 24,
              width: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

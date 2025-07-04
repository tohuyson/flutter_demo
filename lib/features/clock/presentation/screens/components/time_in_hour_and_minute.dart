import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';

class TimeInHourAndMinute extends StatefulWidget {
  const TimeInHourAndMinute({super.key});

  @override
  State<TimeInHourAndMinute> createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // if you use _timeOfDay.hour then it will show 20:10 like that
          // But we want 8:10
          "${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(width: 5),
        RotatedBox(
          quarterTurns: 0,
          child: Text(period, style: TextStyle(fontSize: AppSize.instance.getProportionateScreenWidth(18))),
        ),
      ],
    );
  }
}

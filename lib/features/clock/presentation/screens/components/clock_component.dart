import 'package:flutter/material.dart';
import 'package:flutter_demo/features/clock/presentation/screens/components/clock.dart';
import 'package:flutter_demo/features/clock/presentation/screens/components/country_card.dart';
import 'package:flutter_demo/features/clock/presentation/screens/components/time_in_hour_and_minute.dart';

class ClockComponent extends StatelessWidget {
  const ClockComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text("Newport Beach, USA | PST", style: Theme.of(context).textTheme.bodyLarge),
            const TimeInHourAndMinute(),
            const Spacer(),
            const Clock(),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CountryCard(
                      country: "New York, USA",
                      timeZone: "+3 HRS | EST",
                      iconSrc: "assets/images/Liberty.svg",
                      time: "9:20",
                      period: "PM",
                    ),
                    CountryCard(
                      country: "Sydney, AU",
                      timeZone: "+19 HRS | AEST",
                      iconSrc: "assets/images/Sydney.svg",
                      time: "1:20",
                      period: "AM",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

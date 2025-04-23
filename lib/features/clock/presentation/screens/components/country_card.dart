import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.country,
    required this.timeZone,
    required this.iconSrc,
    required this.time,
    required this.period,
  });

  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.instance.getProportionateScreenWidth(20)),
      child: SizedBox(
        width: AppSize.instance.getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(AppSize.instance.getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                // color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(fontSize: AppSize.instance.getProportionateScreenWidth(16)),
                ),
                const SizedBox(height: 5),
                Text(timeZone),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(iconSrc, width: AppSize.instance.getProportionateScreenWidth(40)),
                    const Spacer(),
                    Text(time, style: Theme.of(context).textTheme.headlineMedium),
                    RotatedBox(quarterTurns: 0, child: Text(period)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

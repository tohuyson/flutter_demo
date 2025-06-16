import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_extension.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: AppColor.instance.kEmailBadgeColor, borderRadius: BorderRadius.circular(9)),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ).addNeumorphism(
      offset: Offset(4, 4),
      borderRadius: 9,
      blurRadius: 4,
      topShadowColor: Colors.white,
      bottomShadowColor: Color(0xFF30384D).withOpacity(0.3),
    );
  }
}

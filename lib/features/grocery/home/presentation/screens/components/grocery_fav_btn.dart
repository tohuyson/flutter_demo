import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';

class GroceryFavBtn extends StatelessWidget {
  const GroceryFavBtn({super.key, this.radius = 12});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColor.instance.lightGreyColor,
      child: Image.asset("assets/images/heart.png"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';

class GroceryRoundedBtn extends StatelessWidget {
  const GroceryRoundedBtn({super.key, required this.iconData, this.color, required this.press});

  final IconData iconData;
  final Color? color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      onPressed: press,
      child: Icon(iconData, color: color ?? AppColor.instance.backgroundGreyColor),
    );
  }
}

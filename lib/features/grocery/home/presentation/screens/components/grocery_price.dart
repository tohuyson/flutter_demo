import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';

class GroceryPrice extends StatelessWidget {
  const GroceryPrice({super.key, required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\$",
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColor.instance.greenColor),
        children: [
          TextSpan(text: amount, style: const TextStyle(color: Colors.black)),
          const TextSpan(text: "/kg", style: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}

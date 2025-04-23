import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/details/presentation/components/grocery_rounded_icon_btn.dart';

class GroceryCartCounter extends StatelessWidget {
  const GroceryCartCounter({super.key, required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF6F6F6), borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Row(
        children: [
          GroceryRoundedBtn(iconData: Icons.remove, color: Colors.black38, press: () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding / 4),
            child: Text(quantity.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
          ),
          GroceryRoundedBtn(iconData: Icons.add, press: () {}),
        ],
      ),
    );
  }
}

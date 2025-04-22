import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';

class GroceryHomeHeader extends StatelessWidget {
  const GroceryHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.instance.groceryHeaderHeight,
      color: Colors.white,
      padding: EdgeInsets.all(AppSize.instance.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning!", style: Theme.of(context).textTheme.bodySmall),
              Text("Caesar Rincon", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black54)),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
        ],
      ),
    );
  }
}

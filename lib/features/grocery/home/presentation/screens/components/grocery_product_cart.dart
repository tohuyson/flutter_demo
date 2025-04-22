import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_fav_btn.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_price.dart';
import 'package:flutter_demo/models/grocery/product.dart';

class GroceryProductCart extends StatelessWidget {
  const GroceryProductCart({super.key, required this.product, required this.press});

  final GroceryProduct product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding),
        decoration: BoxDecoration(
          color: AppColor.instance.lightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.instance.defaultPadding * 1.25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: product.title!, child: Image.network(product.image!)),
            Text(product.title!, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
            Text("Fruits", style: Theme.of(context).textTheme.bodySmall),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [GroceryPrice(amount: "20.00"), GroceryFavBtn()],
            ),
          ],
        ),
      ),
    );
  }
}

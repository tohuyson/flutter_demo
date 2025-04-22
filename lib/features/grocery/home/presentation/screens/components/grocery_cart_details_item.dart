import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_price.dart';
import 'package:flutter_demo/models/grocery/product_item.dart';

class GroceryCartDetailsItem extends StatelessWidget {
  const GroceryCartDetailsItem({super.key, required this.productItem});

  final GroceryProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: AppSize.instance.defaultPadding / 2),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(productItem.product.image!),
      ),
      title: Text(
        productItem.product.title!,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            const GroceryPrice(amount: "20"),
            Text(
              "  x ${productItem.quantity}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

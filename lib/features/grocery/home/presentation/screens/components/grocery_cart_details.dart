import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/home/presentation/providers/grocery_home_provider.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_cart_details_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryCartDetails extends ConsumerWidget {
  const GroceryCartDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groceryHomeStateNotifier);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.titleLarge),
          ...List.generate(state.cart.length, (index) => GroceryCartDetailsItem(productItem: state.cart[index])),
          SizedBox(height: AppSize.instance.defaultPadding),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text("Next - \$30"))),
        ],
      ),
    );
  }
}

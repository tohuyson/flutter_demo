import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/home/presentation/providers/grocery_home_provider.dart';
import 'package:flutter_demo/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GroceryCartShort extends ConsumerWidget {
  const GroceryCartShort({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groceryHomeStateNotifier);
    final notifier = ref.read(groceryHomeStateNotifier.notifier);
    return Row(
      children: [
        Text("Cart", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(width: AppSize.instance.defaultPadding),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                state.cart.length,
                (index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoute.groceryDetails.name, extra: state.cart[index].product);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: AppSize.instance.defaultPadding / 2),
                    child: Hero(
                      tag: "${state.cart[index].product.title!}_cartTag",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(state.cart[index].product.image!),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            notifier.totalCartItems().toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.instance.greenColor),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/details/presentation/components/grocery_cart_counter.dart';
import 'package:flutter_demo/features/grocery/home/presentation/providers/grocery_home_provider.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_fav_btn.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_price.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_demo/models/grocery/product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GroceryDetailsScreen extends ConsumerStatefulWidget {
  const GroceryDetailsScreen({super.key, required this.product});

  final GroceryProduct product;

  @override
  ConsumerState<GroceryDetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<GroceryDetailsScreen> {
  String _cartTag = "";
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(groceryHomeStateNotifier.notifier);
    final state = ref.watch(groceryHomeStateNotifier);
    GroceryProductItem? cartItem = state.cart.cast<GroceryProductItem?>().firstWhere(
      (element) => element?.product.title == widget.product.title,
      orElse: () => null,
    );
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                notifier.addProductToCart(widget.product);
                setState(() {
                  _cartTag = '_cartTag';
                });
                GoRouter.of(context).pop();
              },
              child: const Text("Add to Cart"),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Hero(tag: widget.product.title! + _cartTag, child: Image.network(widget.product.image!)),
                ),
                Positioned(bottom: -20, child: GroceryCartCounter(quantity: cartItem?.quantity ?? 1)),
              ],
            ),
          ),
          SizedBox(height: AppSize.instance.defaultPadding * 1.5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const GroceryPrice(amount: "20.00"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSize.instance.defaultPadding),
            child: const Text(
              "Cabbage (comprising several cultivars of Brassica) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
              style: TextStyle(color: Color(0xFFBDBDBD), height: 1.8),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(color: Colors.black),
      backgroundColor: AppColor.instance.backgroundGreyColor,
      elevation: 0,
      centerTitle: true,
      title: const Text("Fruits", style: TextStyle(color: Colors.black)),
      actions: [const GroceryFavBtn(radius: 20), SizedBox(width: AppSize.instance.defaultPadding)],
    );
  }
}

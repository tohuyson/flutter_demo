import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_data.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/grocery/home/presentation/providers/grocery_home_provider.dart';
import 'package:flutter_demo/features/grocery/home/presentation/providers/state/grocery_home_notifier.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_cart_details.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_cart_short.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_home_header.dart';
import 'package:flutter_demo/features/grocery/home/presentation/screens/components/grocery_product_cart.dart';
import 'package:flutter_demo/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GroceryHomeScreen extends ConsumerStatefulWidget {
  const GroceryHomeScreen({super.key});

  @override
  ConsumerState<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends ConsumerState<GroceryHomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      ref.read(groceryHomeStateNotifier.notifier).changeHomeState(GroceryHomeEnum.cart);
    } else if (details.primaryDelta! > 12) {
      ref.read(groceryHomeStateNotifier.notifier).changeHomeState(GroceryHomeEnum.normal);
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: AppData.instance.panelTransition);
    Future(() {
      ref.read(groceryHomeStateNotifier.notifier).getProducts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(groceryHomeStateNotifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: AppColor.instance.backgroundGreyColor,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: AppData.instance.panelTransition,
                        top:
                            state.homeStatus == GroceryHomeEnum.normal
                                ? AppSize.instance.groceryHeaderHeight
                                : -(constraints.maxHeight -
                                    AppSize.instance.groceryCartBarHeight * 2 -
                                    AppSize.instance.groceryHeaderHeight),
                        left: 0,
                        right: 0,
                        height:
                            constraints.maxHeight -
                            AppSize.instance.groceryHeaderHeight -
                            AppSize.instance.groceryCartBarHeight,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(AppSize.instance.defaultPadding * 1.5),
                              bottomRight: Radius.circular(AppSize.instance.defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: state.products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: AppSize.instance.defaultPadding,
                              crossAxisSpacing: AppSize.instance.defaultPadding,
                            ),
                            itemBuilder:
                                (context, index) => GroceryProductCart(
                                  product: state.products[index],
                                  press: () {
                                    GoRouter.of(
                                      context,
                                    ).pushNamed(AppRoute.groceryDetails.name, extra: state.products[index]);
                                  },
                                ),
                          ),
                        ),
                      ),
                      // Card Panel
                      AnimatedPositioned(
                        duration: AppData.instance.panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height:
                            state.homeStatus == GroceryHomeEnum.normal
                                ? AppSize.instance.groceryCartBarHeight
                                : (constraints.maxHeight - AppSize.instance.groceryCartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            padding: EdgeInsets.all(AppSize.instance.defaultPadding),
                            color: AppColor.instance.backgroundGreyColor,
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: AppData.instance.panelTransition,
                              child:
                                  state.homeStatus == GroceryHomeEnum.normal
                                      ? const GroceryCartShort()
                                      : const GroceryCartDetails(),
                            ),
                          ),
                        ),
                      ),
                      // Header
                      AnimatedPositioned(
                        duration: AppData.instance.panelTransition,
                        top: state.homeStatus == GroceryHomeEnum.normal ? 0 : -AppSize.instance.groceryHeaderHeight,
                        right: 0,
                        left: 0,
                        height: 85,
                        child: const GroceryHomeHeader(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter_demo/constants/api_state.dart';
import 'package:flutter_demo/di/get_it.dart';
import 'package:flutter_demo/features/grocery/home/domain/use_cases/grocery_get_products_user_case.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_demo/models/grocery/product_item.dart';
import 'package:flutter_demo/shared/utils/log_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'grocery_home_state.dart';

class GroceryHomeNotifier extends StateNotifier<GroceryHomeState> {
  GroceryHomeNotifier() : super(const GroceryHomeState.initial());

  final GroceryGetProductsUserCase _groceryGetProductsUserCase = getIt.get<GroceryGetProductsUserCase>();

  changeHomeState(GroceryHomeEnum homeStatus) {
    state = state.copyWith(homeStatus: homeStatus);
  }

  addProductToCart(GroceryProduct product) {
    for (var item in state.cart) {
      if (item.product.title == product.title) {
        item.increment();

        state = state.copyWith();
        return;
      }
    }

    var cart = [...state.cart];
    cart.add(GroceryProductItem(quantity: 1, product: product));

    state = state.copyWith(cart: cart);
  }

  int totalCartItems() => state.cart.fold(0, (previousValue, element) => previousValue + element.quantity);

  getProducts() async {
    AppLog.i("GroceryHomeNotifier", "getProducts");
    state = state.copyWith(apiState: ApiState.loading);
    final products = await _groceryGetProductsUserCase.execute();
    products.fold(
      (failure) {
        state = state.copyWith(apiState: ApiState.failure);
      },
      (success) {
        state = state.copyWith(apiState: ApiState.success, products: success);
      },
    );
    // Simulate an API call
    // Future.delayed(const Duration(seconds: 2), () {
    //   state = state.copyWith(
    //     apiState: ApiState.success,
    //     products: [
    //       GroceryProduct(
    //         title: "Cabbage",
    //         image: "https://cafeandbooks.wordpress.com/wp-content/uploads/2015/07/dscn4570.jpg",
    //       ),
    //       GroceryProduct(
    //         title: "Broccoli",
    //         image: "https://cafeandbooks.wordpress.com/wp-content/uploads/2015/07/dscn4565.jpg",
    //       ),
    //       GroceryProduct(
    //         title: "Carrot",
    //         image: "https://cafeandbooks.wordpress.com/wp-content/uploads/2015/07/dscn4570.jpg",
    //       ),
    //       GroceryProduct(
    //         title: "Pakcoy",
    //         image: "https://cafeandbooks.wordpress.com/wp-content/uploads/2015/07/dscn4565.jpg",
    //       ),
    //       GroceryProduct(
    //         title: "Cucumber",
    //         image: "https://cafeandbooks.wordpress.com/wp-content/uploads/2015/07/dscn4570.jpg",
    //       ),
    //     ],
    //   );
    // });
  }
}

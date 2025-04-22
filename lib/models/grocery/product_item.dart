
import 'package:flutter_demo/models/grocery/product.dart';

class GroceryProductItem {
  int quantity;
  GroceryProduct product;

  GroceryProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }
}

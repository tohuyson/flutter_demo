import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/grocery/home/domain/repository/grocery_home_repository.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_demo/shared/utils/app_exception.dart';

class GroceryGetProductsUserCase {
  final GroceryHomeRepository groceryHomeRepository;

  GroceryGetProductsUserCase({required this.groceryHomeRepository});

  Future<Either<AppException, List<GroceryProduct>>> execute() async {
    return groceryHomeRepository.getProducts();
  }
}

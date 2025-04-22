import 'package:dartz/dartz.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_demo/shared/utils/app_exception.dart';

abstract class GroceryHomeRepository {
  Future<Either<AppException, List<GroceryProduct>>> getProducts();
}

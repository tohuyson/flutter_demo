import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/grocery/home/data/datasource/remote/grocery_home_remote_data_source.dart';
import 'package:flutter_demo/features/grocery/home/domain/repository/grocery_home_repository.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_demo/shared/utils/app_exception.dart';

class GroceryHomeRepositoryImpl extends GroceryHomeRepository {
  final GroceryHomeRemoteDataSource homeRemoteDataSource;

  GroceryHomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<AppException, List<GroceryProduct>>> getProducts() async {
    final response = await homeRemoteDataSource.getProducts();
    return response.fold((failure) => Left(failure), (success) {
      return Right(success);
    });
  }
}

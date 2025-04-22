import 'package:dartz/dartz.dart';
import 'package:flutter_demo/features/grocery/home/data/datasource/remote/grocery_home_remote_data_source.dart';
import 'package:flutter_demo/models/grocery/product.dart';
import 'package:flutter_demo/shared/network/network_service.dart';
import 'package:flutter_demo/shared/utils/app_exception.dart';
import 'package:flutter_demo/shared/utils/log_util.dart';

class GroceryHomeRemoteDataSourceImpl extends GroceryHomeRemoteDataSource {
  final NetworkService networkService;

  GroceryHomeRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<AppException, List<GroceryProduct>>> getProducts() async {
    const endpoint = '/products';
    final response = await networkService.get(endpoint, queryParams: {});

    return response.fold((l) => Left(l), (r) {
      final jsonData = r.data;
      AppLog.d('GroceryHomeRemoteDataSourceImpl', 'getProducts --- $endpoint --- $jsonData');
      if (jsonData == null) {
        return Left(
          AppException(
            identifier: endpoint,
            statusCode: 0,
            message: 'The data is not in the valid format',
            which: 'http',
          ),
        );
      }

      List<GroceryProduct> productsResponse =
          (jsonData['data'] as List).map((e) => GroceryProduct.fromJson(e)).toList();
      return Right(productsResponse);
    });
  }
}

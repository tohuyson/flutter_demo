import 'package:flutter_demo/features/grocery/home/data/datasource/remote/grocery_home_remote_data_source.dart';
import 'package:flutter_demo/features/grocery/home/data/datasource/remote/grocery_home_remote_data_source_impl.dart';
import 'package:flutter_demo/features/grocery/home/data/repository/grocery_home_repository_impl.dart';
import 'package:flutter_demo/features/grocery/home/domain/repository/grocery_home_repository.dart';
import 'package:flutter_demo/features/grocery/home/domain/use_cases/grocery_get_products_user_case.dart';
import 'package:flutter_demo/shared/network/dio_network_service.dart';
import 'package:flutter_demo/shared/network/network_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initSingletons() async {
  //Services
  getIt.registerLazySingleton<NetworkService>(() => DioNetworkService());
  //initiating db
}

void provideDataSources() {
  // Grocery Home
  getIt.registerFactory<GroceryHomeRemoteDataSource>(
    () => GroceryHomeRemoteDataSourceImpl(networkService: getIt.get<NetworkService>()),
  );
}

void provideRepositories() {
  //Grocery home
  getIt.registerFactory<GroceryHomeRepository>(
    () => GroceryHomeRepositoryImpl(homeRemoteDataSource: getIt.get<GroceryHomeRemoteDataSource>()),
  );
}

void provideUseCases() {
  //Grocery home
  getIt.registerFactory<GroceryGetProductsUserCase>(
    () => GroceryGetProductsUserCase(groceryHomeRepository: getIt.get<GroceryHomeRepository>()),
  );
}

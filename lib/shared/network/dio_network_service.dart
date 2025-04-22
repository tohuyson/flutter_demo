import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/models/response/response.dart' as response;
import 'package:flutter_demo/shared/network/exception/network_handler_mixin.dart';
import 'package:flutter_demo/shared/network/network_service.dart';
import 'package:flutter_demo/shared/utils/app_exception.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  late Dio dio;

  DioNetworkService() {
    dio = Dio();
    dio.options = dioBaseOptions;
    // if (kDebugMode) {
    //   dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );

  @override
  String get baseUrl => dotenv.env[NetworkEnv.BASE_URL.name] ?? '';

  @override
  Map<String, Object> get headers => {'accept': 'application/json', 'content-type': 'application/json'};

  @override
  Map<String, dynamic>? updateHeaders(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = headers;
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endPoint, {Map<String, dynamic>? queryParams}) {
    queryParams ??= {};
    final res = handleException(() => dio.get(endPoint, queryParameters: queryParams), endPoint: endPoint);
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endPoint, {Map<String, dynamic>? data}) {
    // queryParams[Params.apiKey] = apiKey;
    final res = handleException(() => dio.post(endPoint, data: data), endPoint: endPoint);
    return res;
  }
}

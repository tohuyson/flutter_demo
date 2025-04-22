import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flutter_demo/models/response/response.dart' as response;
import 'package:flutter_demo/shared/network/network_service.dart';
import 'package:flutter_demo/shared/utils/app_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>> handleException<T extends Object>(
    Future<Response<dynamic>> Function() handler, {
    String endPoint = '',
  }) async {
    try {
      final res = await handler();
      return Right(
        response.Response(statusCode: res.statusCode ?? 200, data: res.data, statusMessage: res.statusMessage),
      );
    } catch (ex) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      switch (ex.runtimeType) {
        case DioException _:
          ex as DioException;
          message = ex.response?.data?['message'] ?? 'Internal Error occurred';
          statusCode = 0;
          identifier = 'Dio Exception ${ex.message}\n at  $endPoint';
          break;

        default:
          message = 'unknown error occurred';
          statusCode = 0;
          identifier = 'unknown error ${ex.toString()}\n at  $endPoint';
          break;
      }
      return Left(AppException(message: message, statusCode: statusCode, identifier: identifier, which: 'http'));
    }
  }
}

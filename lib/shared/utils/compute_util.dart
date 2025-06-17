import 'dart:async';

import 'package:flutter/foundation.dart';

/// Hàm sync 1 tham số: T -> R
typedef ComputeTask<T, R> = R Function(T param);

/// Hàm async 1 tham số: T -> Future<R>
typedef AsyncComputeTask<T, R> = Future<R> Function(T param);

class ComputeUtil {
  /// Chạy hàm sync (synchronous) trong isolate
  static Future<R> runSync<T, R>(ComputeTask<T, R> task, T param) async {
    // compute yêu cầu hàm có dạng FutureOr<R> Function(T)
    return compute(_wrapSync<T, R>(task), param);
  }

  /// Chạy hàm async (asynchronous) trong isolate
  static Future<R> runAsync<T, R>(AsyncComputeTask<T, R> task, T param) async {
    return compute(_wrapAsync<T, R>(task), param);
  }

  // --- Internal ---

  static FutureOr<R> Function(T) _wrapSync<T, R>(ComputeTask<T, R> task) {
    return (T param) => task(param);
  }

  static FutureOr<R> Function(T) _wrapAsync<T, R>(AsyncComputeTask<T, R> task) {
    return (T param) async => await task(param);
  }
}

int heavySum(int n) {
  int sum = 0;
  for (int i = 0; i <= n; i++) {
    sum += i;
  }
  return sum;
}

Future<int> heavySumWithProgress(int n) async {
  int sum = 0;
  for (int i = 0; i <= n; i++) {
    sum += i;
    await Future.delayed(const Duration(microseconds: 1)); // Giả lập công việc nặng
  }
  return sum;
}

// isolate_util.dart
import 'dart:async';
import 'dart:isolate';

typedef IsolateCallback<T, R> = R Function(T data);

class IsolateUtil {
  /// Chạy một hàm nặng trong isolate
  static Future<R> run<T, R>(IsolateCallback<T, R> callback, T param) async {
    final receivePort = ReceivePort();

    // Gửi hàm và tham số cho isolate
    await Isolate.spawn<_IsolateMessage<T, R>>(
      _isolateEntryPoint,
      _IsolateMessage(callback, param, receivePort.sendPort),
    );

    // Đợi kết quả từ isolate
    final result = await receivePort.first as R;
    receivePort.close();
    return result;
  }

  /// Hàm entry chạy trong isolate
  static void _isolateEntryPoint<T, R>(_IsolateMessage<T, R> message) {
    final result = message.callback(message.param);
    message.sendPort.send(result);
  }
}

/// Gói dữ liệu truyền isolate
class _IsolateMessage<T, R> {
  final IsolateCallback<T, R> callback;
  final T param;
  final SendPort sendPort;

  _IsolateMessage(this.callback, this.param, this.sendPort);
}

// Hàm nặng để chạy trong isolate
int heavySum(int n) {
  List<int> list = List.generate(n, (i) => n - i);
  list.sort(); // Sắp xếp mất thời gian

  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i] % 100;
  }

  return sum;
}

typedef HeavyTask<T, R> = R Function(T param, void Function(int percent) onProgress);

class IsolateWithProgress {
  static Future<R> runWithProgress<T, R>({
    required HeavyTask<T, R> task,
    required T param,
    required void Function(int percent) onProgress,
  }) async {
    final mainReceivePort = ReceivePort();
    final completer = Completer<R>();

    await Isolate.spawn<_IsolateMessageWithProgress<T, R>>(
      _isolateEntryPoint,
      _IsolateMessageWithProgress(task, param, mainReceivePort.sendPort),
    );

    SendPort? isolateSendPort;

    late StreamSubscription sub;
    sub = mainReceivePort.listen((msg) {
      if (msg is SendPort) {
        isolateSendPort = msg;
        isolateSendPort!.send('start');
      } else if (msg is _ProgressUpdate) {
        onProgress(msg.percent);
      } else if (msg is _Result<R>) {
        onProgress(100);
        completer.complete(msg.result);
        isolateSendPort?.send('exit');
      } else if (msg == 'done') {
        sub.cancel();
        mainReceivePort.close();
      }
    });

    return completer.future;
  }

  static void _isolateEntryPoint<T, R>(_IsolateMessageWithProgress<T, R> message) {
    final commandPort = ReceivePort();
    message.sendPort.send(commandPort.sendPort);

    final task = message.task;
    final param = message.param;
    final mainSendPort = message.sendPort;

    commandPort.listen((msg) {
      if (msg == 'start') {
        final result = task(param, (int percent) {
          mainSendPort.send(_ProgressUpdate(percent));
        });
        mainSendPort.send(_Result(result));
      } else if (msg == 'exit') {
        commandPort.close();
        mainSendPort.send('done');
      }
    });
  }
}

class _IsolateMessageWithProgress<T, R> {
  final HeavyTask<T, R> task;
  final T param;
  final SendPort sendPort;

  _IsolateMessageWithProgress(this.task, this.param, this.sendPort);
}

class _ProgressUpdate {
  final int percent;
  _ProgressUpdate(this.percent);
}

class _Result<R> {
  final R result;
  _Result(this.result);
}

// Hàm nặng với callback báo tiến độ
int heavySumWithProgress(int n, void Function(int percent) onProgress) {
  int sum = 0;
  for (int i = 0; i <= n; i++) {
    sum += i;
    if (i % (n ~/ 100) == 0) {
      onProgress((i * 100 ~/ n).clamp(0, 100));
    }
  }
  return sum;
}

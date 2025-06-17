import 'package:flutter/material.dart';
import 'package:flutter_demo/shared/utils/isolate_util.dart';

class IsolateLoadingScreen extends StatefulWidget {
  const IsolateLoadingScreen({super.key});

  @override
  _IsolateLoadingScreenState createState() => _IsolateLoadingScreenState();
}

class _IsolateLoadingScreenState extends State<IsolateLoadingScreen> {
  int? result;
  bool loading = false;
  int progress = 0;

  void _runTask() async {
    setState(() {
      loading = true;
      result = null;
    });

    final sum = await IsolateUtil.run<int, int>(heavySum, 100000000);

    setState(() {
      result = sum;
      loading = false;
    });
  }

  Future<void> _start() async {
    setState(() {
      progress = 0;
      result = null;
      loading = true;
    });

    final res = await IsolateWithProgress.runWithProgress<int, int>(
      task: heavySumWithProgress,
      param: 1000000000,
      onProgress: (percent) {
        setState(() {
          progress = percent;
        });
      },
    );

    setState(() {
      result = res;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading
                ? Column(children: [CircularProgressIndicator(), SizedBox(height: 12), Text("Đang xử lý: $progress%")])
                : result != null
                ? Text("Kết quả: $result", style: const TextStyle(fontSize: 20))
                : const Text("Nhấn để bắt đầu"),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: loading ? null : _runTask, child: const Text("Bắt đầu tính tổng 1 -> 100 triệu")),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: loading ? null : _start,
              child: const Text("Bắt đầu tính tổng 1 -> 50 triệu với tiến trình"),
            ),
          ],
        ),
      ),
    );
  }
}

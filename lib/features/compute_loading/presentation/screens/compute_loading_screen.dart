import 'package:flutter/material.dart';
import 'package:flutter_demo/shared/utils/compute_util.dart';

class ComputeLoadingScreen extends StatefulWidget {
  const ComputeLoadingScreen({super.key});

  @override
  State<ComputeLoadingScreen> createState() => _ComputeLoadingScreenState();
}

class _ComputeLoadingScreenState extends State<ComputeLoadingScreen> {
  bool isLoading = false;
  int? result;

  void _startCompute() async {
    setState(() {
      isLoading = true;
      result = null;
    });

    final res = await ComputeUtil.runSync<int, int>(heavySum, 100000000);

    setState(() {
      result = res;
      isLoading = false;
    });
  }

  void _startAsyncCompute() async {
    setState(() {
      isLoading = true;
      result = null;
    });

    final res = await ComputeUtil.runAsync<int, int>(heavySumWithProgress, 1000000);

    setState(() {
      result = res;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ComputeUtil Demo')),
      body: Center(
        child:
            isLoading
                ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator(), SizedBox(height: 16), Text("Đang xử lý...")],
                )
                : result != null
                ? Text("Kết quả: $result", style: const TextStyle(fontSize: 18))
                : const Text("Nhấn nút để bắt đầu"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isLoading ? null : _startCompute,
        label: const Text("Tính tổng"),
        icon: const Icon(Icons.calculate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      persistentFooterButtons: [
        ElevatedButton(onPressed: isLoading ? null : _startAsyncCompute, child: const Text("Tính tổng Async")),
      ],
    );
  }
}

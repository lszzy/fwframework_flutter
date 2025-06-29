import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class TestScreenutilPage extends ConsumerWidget {
  const TestScreenutilPage({super.key});

  Map<String, dynamic> get _data => {};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = _data;
    final keys = data.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_screenutil'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(keys[index]),
            trailing: Text(
              data[keys[index]].toString(),
              style: const TextStyle(fontSize: 15),
            ),
          );
        },
        itemCount: keys.length,
      ),
    );
  }
}

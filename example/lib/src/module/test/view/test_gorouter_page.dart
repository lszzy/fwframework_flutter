import 'package:example/src/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class TestGorouterExtra {
  const TestGorouterExtra(this.name);

  final String name;
}

class TestGorouterPage extends StatelessWidget {
  const TestGorouterPage({
    super.key,
    required this.path,
    this.query,
    this.extra,
  });

  final String path;
  final String? query;
  final TestGorouterExtra? extra;

  Map<String, dynamic> get _data => {
        'path': path,
        'query': query,
        if (extra != null) '\$extra': extra!.name,
        'url':
            TestGorouterRoute(path: path, query: query, $extra: extra).location,
      };

  @override
  Widget build(BuildContext context) {
    final data = _data;
    final keys = data.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('go_router'),
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
    ).onAppear(() {
      FwdebugFlutter.info('TestGorouterPage.onAppear');
    }).onDisappear(() {
      FwdebugFlutter.info('TestGorouterPage.onDisappear');
    });
  }
}

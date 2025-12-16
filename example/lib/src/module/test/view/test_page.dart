import 'package:example/gen/l10n.dart';
import 'package:example/src/app/app_router.dart';
import 'package:example/src/module/test/view/test_gorouter_page.dart';
import 'package:flutter/material.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late final Map<String, dynamic> _testRoutes;

  @override
  void initState() {
    _testRoutes = {
      'go_router': () {
        const TestGorouterRoute(
          path: 'path',
          query: 'query',
          $extra: TestGorouterExtra('\$extra'),
        ).push(context);
      },
      'flutter_screenutil': TestScreenutilRoute().location,
      'plugin_test': TestPluginRoute().location,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeKeys = _testRoutes.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tabbar_test,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: context.appTheme.primaryColor,
      ),
      backgroundColor: context.appTheme.bgColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          final routeKey = routeKeys[index];
          return ListTile(
            title: Text(routeKey),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              final route = _testRoutes[routeKey];
              if (route is Function) {
                route();
              } else {
                AppRouter.router.push(_testRoutes[routeKey]);
              }
            },
          );
        },
        itemCount: routeKeys.length,
      ).onAppear(() {
        FwdebugFlutter.info('TestPage.onAppear');
      }).onDisappear(() {
        FwdebugFlutter.info('TestPage.onDisappear');
      }),
    );
  }
}

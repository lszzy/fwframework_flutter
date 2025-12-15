import 'package:example/gen/assets.gen.dart';
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
  bool showsEmpty = false;

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
      'show_loading': () {
        context.showLoading();
        Future.delayed(const Duration(seconds: 2)).then((_) {
          if (mounted) {
            context.hideLoading();
          }
        });
      },
      'show_toast': () {
        context.showToast(
          '我是Toast消息',
          completion: () {
            FwdebugFlutter.debug('Toast消息已隐藏');
          },
        );
      },
      'show_empty': () {
        setStateIfMounted(() {
          showsEmpty = true;
        });
      },
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tabbar_test,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: context.appTheme.primaryColor,
      ),
      backgroundColor: context.appTheme.bgColor,
      body: showsEmpty ? _buildEmpty(context) : _buildBody(context),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return context.emptyWidget(
      text: "This is text",
      detail: "Text is detail",
      image: AppAssets.images.test.image(),
      button: "Refresh",
      action: () {
        setStateIfMounted(() {
          showsEmpty = false;
        });
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    final routeKeys = _testRoutes.keys.toList();
    return ListView.builder(
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
    });
  }
}

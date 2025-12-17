import 'package:example/src/module/test/view/test_gorouter_page.dart';
import 'package:example/src/module/test/view/test_screenutil_page.dart';
import 'package:example/src/module/test/view/test_plugin_page.dart';
import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

part 'app_router.g.dart';

@TypedGoRoute<TestGorouterRoute>(path: '/test/go_router/:path')
class TestGorouterRoute extends GoRouteData with $TestGorouterRoute {
  const TestGorouterRoute({
    required this.path,
    this.query,
    this.$extra,
  });

  final String path;
  final String? query;
  final TestGorouterExtra? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return AppRouter.presentTransitionPage(
      TestGorouterPage(path: path, query: query, extra: $extra),
      key: state.pageKey,
    );
  }
}

@TypedGoRoute<TestScreenutilRoute>(path: '/test/flutter_screenutil')
class TestScreenutilRoute extends GoRouteData with $TestScreenutilRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestScreenutilPage();
  }
}

@TypedGoRoute<TestPluginRoute>(path: '/test/plugin')
class TestPluginRoute extends GoRouteData with $TestPluginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestPluginPage();
  }
}

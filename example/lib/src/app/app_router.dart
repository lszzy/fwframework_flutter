import 'package:example/src/module/home/view/tab_page.dart';
import 'package:example/src/module/test/view/test_gorouter_page.dart';
import 'package:example/src/module/test/view/test_screenutil_page.dart';
import 'package:flutter/material.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
  observers: [FwdebugFlutter.navigatorObserver],
);

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const TabPage();
}

@TypedGoRoute<TestGorouterRoute>(path: '/test/go_router/:path')
class TestGorouterRoute extends GoRouteData {
  const TestGorouterRoute({
    required this.path,
    this.query,
    this.$extra,
  });

  final String path;
  final String? query;
  final TestGorouterExtra? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TestGorouterPage(path: path, query: query, extra: $extra);
  }
}

@TypedGoRoute<TestScreenutilRoute>(path: '/test/flutter_screenutil')
class TestScreenutilRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestScreenutilPage();
  }
}

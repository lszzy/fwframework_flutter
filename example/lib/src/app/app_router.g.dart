// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $testGorouterRoute,
      $testScreenutilRoute,
      $testPluginRoute,
    ];

RouteBase get $testGorouterRoute => GoRouteData.$route(
      path: '/test/go_router/:path',
      factory: $TestGorouterRoute._fromState,
    );

mixin $TestGorouterRoute on GoRouteData {
  static TestGorouterRoute _fromState(GoRouterState state) => TestGorouterRoute(
        path: state.pathParameters['path']!,
        query: state.uri.queryParameters['query'],
        $extra: state.extra as TestGorouterExtra?,
      );

  TestGorouterRoute get _self => this as TestGorouterRoute;

  @override
  String get location => GoRouteData.$location(
        '/test/go_router/${Uri.encodeComponent(_self.path)}',
        queryParams: {
          if (_self.query != null) 'query': _self.query,
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $testScreenutilRoute => GoRouteData.$route(
      path: '/test/flutter_screenutil',
      factory: $TestScreenutilRoute._fromState,
    );

mixin $TestScreenutilRoute on GoRouteData {
  static TestScreenutilRoute _fromState(GoRouterState state) =>
      TestScreenutilRoute();

  @override
  String get location => GoRouteData.$location(
        '/test/flutter_screenutil',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $testPluginRoute => GoRouteData.$route(
      path: '/test/plugin',
      factory: $TestPluginRoute._fromState,
    );

mixin $TestPluginRoute on GoRouteData {
  static TestPluginRoute _fromState(GoRouterState state) => TestPluginRoute();

  @override
  String get location => GoRouteData.$location(
        '/test/plugin',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $testGorouterRoute,
      $testScreenutilRoute,
    ];

RouteBase get $testGorouterRoute => GoRouteData.$route(
      path: '/test/go_router/:path',
      factory: $TestGorouterRouteExtension._fromState,
    );

extension $TestGorouterRouteExtension on TestGorouterRoute {
  static TestGorouterRoute _fromState(GoRouterState state) => TestGorouterRoute(
        path: state.pathParameters['path']!,
        query: state.uri.queryParameters['query'],
        $extra: state.extra as TestGorouterExtra?,
      );

  String get location => GoRouteData.$location(
        '/test/go_router/${Uri.encodeComponent(path)}',
        queryParams: {
          if (query != null) 'query': query,
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $testScreenutilRoute => GoRouteData.$route(
      path: '/test/flutter_screenutil',
      factory: $TestScreenutilRouteExtension._fromState,
    );

extension $TestScreenutilRouteExtension on TestScreenutilRoute {
  static TestScreenutilRoute _fromState(GoRouterState state) =>
      TestScreenutilRoute();

  String get location => GoRouteData.$location(
        '/test/flutter_screenutil',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

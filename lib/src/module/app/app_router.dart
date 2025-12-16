import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter get router {
    assert(
      _router != null,
      'AppRouter has not been initialized. Call AppRouter.init() before accessing the router.',
    );
    return _router!;
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter? _router;

  static GoRouter init({
    required List<RouteBase> routes,
    String? initialLocation,
    Object? initialExtra,
    List<NavigatorObserver>? observers,
    GoRouterRedirect? redirect,
    GoExceptionHandler? onException,
    GoRouterPageBuilder? errorPageBuilder,
    GoRouterWidgetBuilder? errorBuilder,
  }) {
    _router ??= GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: initialLocation,
      initialExtra: initialExtra,
      routes: routes,
      observers: observers,
      redirect: redirect,
      onException: onException,
      errorPageBuilder: errorPageBuilder,
      errorBuilder: errorBuilder,
    );
    return _router!;
  }

  static StatefulShellRoute shellRoute({
    required List<RouteBase> routes,
    StatefulShellRoutePageBuilder? pageBuilder,
    StatefulShellRouteBuilder? builder,
    GoRouterRedirect? redirect,
  }) {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: navigatorKey,
      branches:
          routes.map((route) => StatefulShellBranch(routes: [route])).toList(),
      pageBuilder: pageBuilder,
      builder: builder,
      redirect: redirect,
    );
  }

  static Page buildPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(key: state.pageKey, child: child);
  }

  static CustomTransitionPage fadeTransitionPage(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return fadeTransition(animation, child);
      },
    );
  }

  static CustomTransitionPage presentTransitionPage(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return presentTransition(animation, child);
      },
    );
  }

  static Widget fadeTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
      child: child,
    );
  }

  static Widget presentTransition(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
      child: child,
    );
  }
}

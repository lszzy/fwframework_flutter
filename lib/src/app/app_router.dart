import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static late final GoRouter router;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Page buildPage({
    required Widget child,
    required GoRouterState state,
    bool useCupertinoPage = false,
  }) {
    if (useCupertinoPage) {
      return CupertinoPage(key: state.pageKey, child: child);
    }
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ExitAppScope extends StatelessWidget {
  final Widget child;
  final Future<bool> Function()? onWillPop;
  final String? message;
  final Duration? duration;

  const ExitAppScope({
    super.key,
    required this.child,
    this.onWillPop,
    this.message,
    this.duration,
  });

  static DateTime? _lastPopTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _onPopInvoked();
      },
      child: child,
    );
  }

  Future<void> _onPopInvoked() async {
    if (onWillPop != null) {
      // 如果onWillPop返回false，不退出应用
      if ((await onWillPop?.call()) == false) return;
    }

    final now = DateTime.now();
    if (_lastPopTime == null ||
        now.difference(_lastPopTime!) >
            (duration ?? const Duration(seconds: 1))) {
      _lastPopTime = now;
      // 再按一次退出应用
      SmartDialog.showToast(message ?? 'Press again to exit the app');
      return;
    }

    SystemNavigator.pop();
  }
}

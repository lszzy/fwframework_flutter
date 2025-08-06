import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

extension AppearDetectorExtension on Widget {
  Widget onAppear(VoidCallback? action, {double fraction = 1}) =>
      AppearDetector(onAppear: action, appearFraction: fraction, child: this);

  Widget onDisappear(VoidCallback? action, {double fraction = 1}) =>
      AppearDetector(
          onDisappear: action, disappearFraction: fraction, child: this);
}

class AppearDetector extends StatelessWidget {
  AppearDetector({
    super.key,
    required this.child,
    this.onAppear,
    this.onDisappear,
    this.appearFraction = 1,
    this.disappearFraction = 0,
  });

  final Widget child;
  final VoidCallback? onAppear;
  final VoidCallback? onDisappear;
  final double appearFraction;
  final double disappearFraction;

  late final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: super.key ?? _key,
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= appearFraction) {
          onAppear?.call();
        } else if (info.visibleFraction <= disappearFraction) {
          onDisappear?.call();
        }
      },
      child: child,
    );
  }
}

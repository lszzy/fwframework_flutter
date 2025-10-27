import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    super.key,
    this.alignment,
    required this.children,
  });

  final AlignmentGeometry? alignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? const Alignment(0, -0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

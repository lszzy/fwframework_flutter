import 'package:flutter/material.dart';

extension ClickableWidgetExtension on Widget {
  Widget onTap(
    dynamic Function() onTap, {
    HitTestBehavior behavior = HitTestBehavior.opaque,
    int timeout = 60,
    int? interval,
  }) {
    return ClickableWidget(
      onTap: onTap,
      behavior: behavior,
      timeout: timeout,
      interval: interval,
      child: this,
    );
  }
}

class ClickableWidget extends StatefulWidget {
  final dynamic Function() onTap;
  final Widget child;
  final HitTestBehavior behavior;
  final int timeout;
  final int? interval;
  const ClickableWidget({
    super.key,
    required this.onTap,
    required this.child,
    this.timeout = 60,
    this.behavior = HitTestBehavior.opaque,
    this.interval,
  });

  @override
  State<ClickableWidget> createState() => _ClickableState();
}

class _ClickableState extends State<ClickableWidget> {
  late bool clickable;

  @override
  void initState() {
    clickable = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior,
      onTap: _onTap,
      child: widget.child,
    );
  }

  void _onTap() async {
    if (!clickable) {
      return;
    }
    clickable = false;
    final ret = widget.onTap();
    await Future.wait([
      Future.delayed(Duration(
          milliseconds: widget.interval != null && widget.interval! > 0
              ? widget.interval!
              : 500)),
      if (ret is Future) ret,
    ])
        .then((value) => clickable = true)
        .timeout(Duration(seconds: widget.timeout > 0 ? widget.timeout : 60))
        .onError((error, stackTrace) => clickable = true);
  }
}

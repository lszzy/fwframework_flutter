extension FunctionExtension on Function {
  void Function() throttle({int? interval, int timeout = 60}) {
    bool callable = true;
    return () async {
      if (!callable) return;
      callable = false;
      final ret = this();
      await Future.wait([
        Future.delayed(Duration(
            milliseconds: interval != null && interval > 0 ? interval : 500)),
        if (ret is Future) ret,
      ])
          .then((value) => callable = true)
          .timeout(Duration(seconds: timeout > 0 ? timeout : 60))
          .onError((error, stackTrace) => callable = true);
    };
  }
}

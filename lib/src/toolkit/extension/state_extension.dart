import 'package:flutter/material.dart';

extension StateExtension on State {
  void setStateIfMounted([VoidCallback? fn]) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn ?? () {});
    }
  }
}

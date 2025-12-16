import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

abstract class ToastPluginInterface {
  void showLoading({
    required String text,
    required BuildContext context,
  });

  void hideLoading({required BuildContext context});

  void showToast(
    String text, {
    required BuildContext context,
    VoidCallback? completion,
  });
}

class ToastPlugin implements ToastPluginInterface {
  static ToastPluginInterface get instance => _instance;
  static void register(ToastPluginInterface instance) {
    _instance = instance;
  }

  static ToastPluginInterface _instance = ToastPlugin();

  String Function(BuildContext context)? loadingText;

  @override
  void showLoading({required String text, required BuildContext context}) {
    if (text.isEmpty && loadingText != null) text = loadingText!(context);
    if (text.isNotEmpty) {
      SmartDialog.showLoading(msg: text);
    } else {
      SmartDialog.showLoading();
    }
  }

  @override
  void hideLoading({required BuildContext context}) {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  @override
  void showToast(String text,
      {required BuildContext context, VoidCallback? completion}) {
    SmartDialog.showToast(text, onDismiss: completion);
  }
}

extension ToastPluginExtension on BuildContext {
  void showLoading({String text = ''}) {
    ToastPlugin.instance.showLoading(text: text, context: this);
  }

  void hideLoading() {
    ToastPlugin.instance.hideLoading(context: this);
  }

  void showToast(String text, {VoidCallback? completion}) {
    ToastPlugin.instance.showToast(text, context: this, completion: completion);
  }
}

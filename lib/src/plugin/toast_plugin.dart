import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

abstract class ToastPluginInterface {
  void showLoading({
    String? text,
    BuildContext? context,
  });

  void hideLoading({BuildContext? context});

  void showToast(
    String text, {
    BuildContext? context,
    VoidCallback? completion,
  });
}

class ToastPlugin implements ToastPluginInterface {
  static ToastPluginInterface get instance => _instance;
  static void register(ToastPluginInterface instance) {
    _instance = instance;
  }

  static ToastPluginInterface _instance = ToastPlugin();

  String? Function(BuildContext? context)? loadingText;

  @override
  void showLoading({String? text, BuildContext? context}) {
    if (text == null && loadingText != null) text = loadingText!(context);
    if (text != null && text.isNotEmpty) {
      SmartDialog.showLoading(msg: text);
    } else {
      SmartDialog.showLoading();
    }
  }

  @override
  void hideLoading({BuildContext? context}) {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  @override
  void showToast(String text,
      {BuildContext? context, VoidCallback? completion}) {
    SmartDialog.showToast(text, onDismiss: completion);
  }
}

extension ToastPluginExtension on BuildContext {
  void showLoading({String? text}) {
    ToastPlugin.instance.showLoading(text: text, context: this);
  }

  void hideLoading() {
    ToastPlugin.instance.hideLoading(context: this);
  }

  void showToast(String text, {VoidCallback? completion}) {
    ToastPlugin.instance.showToast(text, context: this, completion: completion);
  }
}

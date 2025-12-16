import 'package:flutter/widgets.dart';

abstract class AlertPluginInterface {
  void showAlert({
    required BuildContext context,
    String? title,
    String? message,
    List<String>? buttons,
    Function(int index)? action,
    String? cancelButton,
    VoidCallback? cancelAction,
  });

  void showConfirm({
    required BuildContext context,
    String? title,
    String? message,
    String? confirmButton,
    VoidCallback? confirmAction,
    String? cancelButton,
    VoidCallback? cancelAction,
  });

  void showPrompt({
    required BuildContext context,
    String? title,
    String? message,
    String? text,
    String? hintText,
    String? confirmButton,
    Function(String text)? confirmAction,
    String? cancelButton,
    VoidCallback? cancelAction,
  });

  void showSheet({
    required BuildContext context,
    String? title,
    String? message,
    List<String>? buttons,
    int currentIndex = -1,
    Function(int index)? action,
    String? cancelButton,
    VoidCallback? cancelAction,
  });
}

class AlertPlugin implements AlertPluginInterface {
  static AlertPluginInterface get instance => _instance;
  static void register(AlertPluginInterface instance) {
    _instance = instance;
  }

  static AlertPluginInterface _instance = AlertPlugin();
  String Function(BuildContext context)? cancelButton = (context) => "Cancel";
  String Function(BuildContext context)? confirmButton = (context) => "Confirm";

  @override
  void showAlert({
    required BuildContext context,
    String? title,
    String? message,
    List<String>? buttons,
    Function(int index)? action,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    // TODO: implement showAlert
  }

  @override
  void showConfirm({
    required BuildContext context,
    String? title,
    String? message,
    String? confirmButton,
    VoidCallback? confirmAction,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    // TODO: implement showConfirm
  }

  @override
  void showPrompt({
    required BuildContext context,
    String? title,
    String? message,
    String? text,
    String? hintText,
    String? confirmButton,
    Function(String text)? confirmAction,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    // TODO: implement showPrompt
  }

  @override
  void showSheet({
    required BuildContext context,
    String? title,
    String? message,
    List<String>? buttons,
    int currentIndex = -1,
    Function(int index)? action,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    // TODO: implement showSheet
  }
}

extension AlertPluginExtension on BuildContext {
  void showAlert({
    String? title,
    String? message,
    List<String>? buttons,
    Function(int index)? action,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    AlertPlugin.instance.showAlert(
      context: this,
      title: title,
      message: message,
      buttons: buttons,
      action: action,
      cancelButton: cancelButton,
      cancelAction: cancelAction,
    );
  }

  void showConfirm({
    String? title,
    String? message,
    String? confirmButton,
    VoidCallback? confirmAction,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    AlertPlugin.instance.showConfirm(
      context: this,
      title: title,
      message: message,
      confirmButton: confirmButton,
      cancelButton: cancelButton,
      cancelAction: cancelAction,
    );
  }

  void showPrompt({
    String? title,
    String? message,
    String? text,
    String? hintText,
    String? confirmButton,
    Function(String text)? confirmAction,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    AlertPlugin.instance.showPrompt(
      context: this,
      title: title,
      message: message,
      text: text,
      hintText: hintText,
      confirmButton: confirmButton,
      confirmAction: confirmAction,
      cancelButton: cancelButton,
      cancelAction: cancelAction,
    );
  }

  void showSheet({
    String? title,
    String? message,
    List<String>? buttons,
    int currentIndex = -1,
    Function(int index)? action,
    String? cancelButton,
    VoidCallback? cancelAction,
  }) {
    AlertPlugin.instance.showSheet(
      context: this,
      title: title,
      message: message,
      buttons: buttons,
      currentIndex: currentIndex,
      action: action,
      cancelButton: cancelButton,
      cancelAction: cancelAction,
    );
  }
}

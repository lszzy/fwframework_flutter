import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fwframework_flutter/src/module/app/app_theme.dart';

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
  TextStyle? Function(BuildContext context, bool isDefault)? alertStyle;
  bool showsSheetCancel = true;

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
    if (cancelButton == null && showsSheetCancel && this.cancelButton != null) {
      cancelButton = this.cancelButton!(context);
    }
    List<Widget>? actions;
    if (buttons != null) {
      actions = [];
      for (var i = 0; i < buttons.length; i++) {
        actions.add(CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            if (action != null) action(i);
          },
          isDefaultAction: i == currentIndex,
          child: Text(
            buttons[i],
            style: (alertStyle != null
                    ? alertStyle!(context, i == currentIndex)
                    : null) ??
                TextStyle(
                  color: i == currentIndex
                      ? context.appTheme.primaryColor
                      : context.appTheme.contentColor,
                ),
          ),
        ));
      }
    }

    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: title != null ? Text(title) : null,
          message: message != null ? Text(message) : null,
          actions: actions,
          cancelButton: cancelButton != null && cancelButton.isNotEmpty
              ? CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    if (cancelAction != null) cancelAction();
                  },
                  isDefaultAction: false,
                  child: Text(
                    cancelButton,
                    style: (alertStyle != null
                            ? alertStyle!(context, false)
                            : null) ??
                        TextStyle(color: context.appTheme.contentColor),
                  ),
                )
              : null,
        );
      },
    );
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

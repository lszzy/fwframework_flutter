import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Widget Function(BuildContext context, TextEditingController controller,
      String? hintText)? textFieldBuilder;
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
    if (cancelButton == null && this.cancelButton != null) {
      cancelButton = this.cancelButton!(context);
    }

    showCupertinoDialog(
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if (buttons != null && buttons.isNotEmpty) {
          for (var i = 0; i < buttons.length; i++) {
            actions.add(CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                if (action != null) action(i);
              },
              isDefaultAction: i == 0,
              textStyle:
                  (alertStyle != null ? alertStyle!(context, i == 0) : null) ??
                      TextStyle(
                        color: i == 0
                            ? context.appTheme.primaryColor
                            : context.appTheme.mainColor,
                      ),
              child: Text(buttons[i]),
            ));
          }
        }

        if (cancelButton != null && cancelButton.isNotEmpty) {
          final cancel = CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              if (cancelAction != null) cancelAction();
            },
            isDefaultAction: false,
            textStyle:
                (alertStyle != null ? alertStyle!(context, false) : null) ??
                    TextStyle(color: context.appTheme.mainColor),
            child: Text(cancelButton),
          );
          if (actions.length == 1) {
            actions.insert(0, cancel);
          } else {
            actions.add(cancel);
          }
        }

        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: message != null ? Text(message) : null,
          actions: actions,
        );
      },
    );
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
    if (confirmButton == null && this.confirmButton != null) {
      confirmButton = this.confirmButton!(context);
    }

    showAlert(
      context: context,
      title: title,
      message: message,
      buttons: confirmButton != null && confirmButton.isNotEmpty
          ? [confirmButton]
          : null,
      action: (index) {
        if (confirmAction != null) confirmAction();
      },
      cancelButton: cancelButton,
      cancelAction: cancelAction,
    );
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
    if (cancelButton == null && this.cancelButton != null) {
      cancelButton = this.cancelButton!(context);
    }
    if (confirmButton == null && this.confirmButton != null) {
      confirmButton = this.confirmButton!(context);
    }

    showCupertinoDialog(
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if (cancelButton != null && cancelButton.isNotEmpty) {
          actions.add(CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              if (cancelAction != null) cancelAction();
            },
            isDefaultAction: false,
            textStyle:
                (alertStyle != null ? alertStyle!(context, false) : null) ??
                    TextStyle(color: context.appTheme.mainColor),
            child: Text(cancelButton),
          ));
        }

        final controller = TextEditingController();
        controller.text = text ?? '';
        if (confirmButton != null && confirmButton.isNotEmpty) {
          actions.add(CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              if (confirmAction != null) {
                confirmAction(controller.text.trim());
              }
            },
            isDefaultAction: true,
            textStyle:
                (alertStyle != null ? alertStyle!(context, true) : null) ??
                    TextStyle(color: context.appTheme.primaryColor),
            child: Text(confirmButton),
          ));
        }

        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: Column(
            children: [
              if (message != null) Text(message),
              textFieldBuilder != null
                  ? textFieldBuilder!(context, controller, hintText)
                  : TextField(
                      controller: controller,
                      autofocus: true,
                      cursorColor: context.appTheme.primaryColor,
                      style: TextStyle(color: context.appTheme.mainColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                      ),
                    ),
            ],
          ),
          actions: actions,
        );
      },
    );
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

    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        List<Widget>? actions;
        if (buttons != null && buttons.isNotEmpty) {
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
                          : context.appTheme.mainColor,
                    ),
              ),
            ));
          }
        }

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
                        TextStyle(color: context.appTheme.mainColor),
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
      confirmAction: confirmAction,
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

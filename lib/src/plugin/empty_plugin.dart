import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

abstract class EmptyPluginInterface {
  Widget emptyWidget({
    required BuildContext context,
    String? text,
    String? detail,
    Widget? image,
    String? button,
    VoidCallback? action,
  });
}

class EmptyPlugin implements EmptyPluginInterface {
  static EmptyPluginInterface get instance => _instance;
  static void register(EmptyPluginInterface instance) {
    _instance = instance;
  }

  static EmptyPluginInterface _instance = EmptyPlugin();

  String? Function(BuildContext context)? emptyText;
  String? Function(BuildContext context)? emptyDetail;
  Widget? Function(BuildContext context)? emptyImage;
  String? Function(BuildContext context)? emptyButton;
  TextStyle? Function(BuildContext context, int index)? emptyStyle;
  List<double> emptySpacings = [];

  @override
  Widget emptyWidget({
    required BuildContext context,
    String? text,
    String? detail,
    Widget? image,
    String? button,
    VoidCallback? action,
  }) {
    if (text == null && emptyText != null) text = emptyText!(context);
    if (detail == null && emptyDetail != null) detail = emptyDetail!(context);
    if (image == null && emptyImage != null) image = emptyImage!(context);
    if (button == null && action != null && emptyButton != null) {
      button = emptyButton!(context);
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null) image,
          if (image != null)
            SizedBox(height: emptySpacings.elementAtOrNull(0) ?? 36),
          if (text != null && text.isNotEmpty)
            Text(
              text,
              style: (emptyStyle != null ? emptyStyle!(context, 0) : null) ??
                  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: context.appTheme.contentColor,
                  ),
            ),
          if (text?.isNotEmpty == true && detail?.isNotEmpty == true)
            SizedBox(height: emptySpacings.elementAtOrNull(1) ?? 10),
          if (detail != null && detail.isNotEmpty)
            Text(
              detail,
              style: (emptyStyle != null ? emptyStyle!(context, 1) : null) ??
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: context.appTheme.tipsColor,
                  ),
            ),
          if (button?.isNotEmpty == true)
            SizedBox(height: emptySpacings.elementAtOrNull(2) ?? 20),
          if (button != null && button.isNotEmpty)
            ClickableWidget(
              onTap: action ?? () {},
              child: Text(
                button,
                style: (emptyStyle != null ? emptyStyle!(context, 2) : null) ??
                    TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: context.appTheme.primaryColor,
                    ),
              ),
            ),
          SizedBox(height: emptySpacings.elementAtOrNull(3) ?? 60),
        ],
      ),
    );
  }
}

extension EmptyPluginExtension on BuildContext {
  Widget emptyWidget({
    String? text,
    String? detail,
    Widget? image,
    String? button,
    VoidCallback? action,
  }) {
    return EmptyPlugin.instance.emptyWidget(
      context: this,
      text: text,
      detail: detail,
      image: image,
      button: button,
      action: action,
    );
  }
}

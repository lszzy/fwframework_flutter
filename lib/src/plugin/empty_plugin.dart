import 'package:flutter/widgets.dart';

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

  @override
  Widget emptyWidget({
    required BuildContext context,
    String? text,
    String? detail,
    Widget? image,
    String? button,
    VoidCallback? action,
  }) {
    // TODO: implement emptyWidget
    throw UnimplementedError();
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

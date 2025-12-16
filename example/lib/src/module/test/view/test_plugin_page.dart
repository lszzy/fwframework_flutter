import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class TestPluginPage extends StatefulWidget {
  const TestPluginPage({super.key});

  @override
  State<TestPluginPage> createState() => _TestPluginPageState();
}

class _TestPluginPageState extends State<TestPluginPage> {
  late final Map<String, dynamic> _testRoutes;
  bool showsEmpty = false;

  @override
  void initState() {
    _testRoutes = {
      'show_loading': () {
        context.showLoading();
        Future.delayed(const Duration(seconds: 2)).then((_) {
          if (mounted) {
            context.hideLoading();
          }
        });
      },
      'show_toast': () {
        context.showToast(
          'This is a toast message',
          completion: () {
            FwdebugFlutter.debug('Toast dismissed');
          },
        );
      },
      'show_empty': () {
        setStateIfMounted(() {
          showsEmpty = true;
        });
      },
      'show_alert': () {
        context.showAlert(
          title: "I am title",
          message: "I am message",
          buttons: ["Button 1"],
          action: (index) {
            context.showToast('Button 1 clicked');
          },
          cancelAction: () {
            context.showToast('Cancel clicked');
          },
        );
      },
      'show_confirm': () {
        context.showConfirm(
          title: "I am title",
          message: "Are you sure?",
          confirmAction: () {
            context.showToast('Confirm clicked');
          },
          cancelAction: () {
            context.showToast('Cancel clicked');
          },
        );
      },
      'show_prompt': () {
        context.showPrompt(
          title: "I am title",
          message: "I am message",
          text: '',
          hintText: 'I am hint text',
          confirmAction: (value) {
            context.showToast('Text: $value');
          },
          cancelAction: () {
            context.showToast('Cancel clicked');
          },
        );
      },
      'show_sheet': () {
        context.showSheet(
          title: "I am title",
          message: "I am message",
          buttons: ["Option 1", "Option 2"],
          currentIndex: 0,
          action: (index) {
            context.showToast('Option ${index + 1} clicked');
          },
          cancelAction: () {
            context.showToast('Cancel clicked');
          },
        );
      },
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Plugin',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: context.appTheme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: context.appTheme.bgColor,
      body: showsEmpty ? _buildEmpty(context) : _buildBody(context),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return context.emptyWidget(
      text: "This is text",
      detail: "Text is detail",
      image: AppAssets.images.test.image(),
      button: "Refresh",
      action: () {
        setStateIfMounted(() {
          showsEmpty = false;
        });
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    final routeKeys = _testRoutes.keys.toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final routeKey = routeKeys[index];
        return ListTile(
          title: Text(routeKey),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            final route = _testRoutes[routeKey];
            if (route is Function) {
              route();
            } else {
              AppRouter.router.push(_testRoutes[routeKey]);
            }
          },
        );
      },
      itemCount: routeKeys.length,
    );
  }
}

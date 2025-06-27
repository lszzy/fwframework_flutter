import 'package:example/gen/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Intl.getCurrentLocale(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onChangeLocale,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onChangeLocale() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('请选择语言'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _onApplyLocale(const Locale.fromSubtags(languageCode: 'en'));
              },
              isDefaultAction: Intl.getCurrentLocale() == 'en',
              child: const Text('English'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _onApplyLocale(const Locale.fromSubtags(
                    languageCode: 'zh', scriptCode: 'Hans'));
              },
              isDefaultAction: Intl.getCurrentLocale() == 'zh_Hans',
              child: const Text('简体中文'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _onApplyLocale(const Locale.fromSubtags(
                    languageCode: 'zh', scriptCode: 'Hant'));
              },
              isDefaultAction: Intl.getCurrentLocale() == 'zh_Hant',
              child: const Text('繁體中文'),
            ),
          ],
        );
      },
    );
  }

  void _onApplyLocale(Locale locale) {
    setState(() {
      S.load(locale);
    });
    Navigator.of(context).pop();
  }
}

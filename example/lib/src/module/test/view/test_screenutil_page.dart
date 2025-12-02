import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class TestScreenutilPage extends StatelessWidget {
  const TestScreenutilPage({super.key});

  Map<String, dynamic> _data(BuildContext context) => {
        'orientation': ScreenUtil().orientation,
        'textScaleFactor': ScreenUtil().textScaleFactor,
        'pixelRatio': ScreenUtil().pixelRatio,
        'screenWidth': ScreenUtil().screenWidth,
        'screenHeight': ScreenUtil().screenHeight,
        'statusBarHeight': ScreenUtil().statusBarHeight,
        'bottomBarHeight': ScreenUtil().bottomBarHeight,
        'navigationBarHeight': ScreenUtil().navigationBarHeight,
        'bottomNavigationBarHeight': ScreenUtil().bottomNavigationBarHeight,
        'scaleWidth': ScreenUtil().scaleWidth,
        'scaleHeight': ScreenUtil().scaleHeight,
        'scaleText': ScreenUtil().scaleText,
        'setWidth(100)': ScreenUtil().setWidth(100),
        'setHeight(100)': ScreenUtil().setHeight(100),
        'radius(100)': ScreenUtil().radius(100),
        'diagonal(100)': ScreenUtil().diagonal(100),
        'diameter(100)': ScreenUtil().diameter(100),
        'setSp(100)': ScreenUtil().setSp(100),
        'deviceType': ScreenUtil().deviceType(context),
        'padding': context.mediaQuery.padding,
        'viewPadding': context.mediaQuery.viewPadding,
        'viewInsets': context.mediaQuery.viewInsets,
      };

  @override
  Widget build(BuildContext context) {
    final data = _data(context);
    final keys = data.keys.toList();
    return Scaffold(
      // PreferredSize包裹AppBar自定义局部导航栏高度
      appBar: AppBar(
        title: const Text(
          'flutter_screenutil',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: context.appTheme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: context.appTheme.bgColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(keys[index]),
            trailing: Text(
              data[keys[index]].toString(),
              style: const TextStyle(fontSize: 15),
            ),
          );
        },
        itemCount: keys.length,
      ),
    );
  }
}

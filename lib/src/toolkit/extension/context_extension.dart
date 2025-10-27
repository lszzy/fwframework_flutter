import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BuildContextExtension on BuildContext {
  static FlutterView get flutterView =>
      WidgetsBinding.instance.platformDispatcher.views.first;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// 安全区域(mediaQuery.viewPadding)
  EdgeInsets get safeAreaInsets => mediaQuery.viewPadding;

  /// 键盘高度(mediaQuery.viewInsets.bottom)
  double get keyboardHeight => mediaQuery.viewInsets.bottom;

  /// 屏幕宽度(mediaQuery.size.width)
  double get screenWidth => ScreenUtil().screenWidth;

  /// 屏幕高度(mediaQuery.size.height)
  double get screenHeight => ScreenUtil().screenHeight;

  /// 状态栏高度(mediaQuery.padding.top)
  double get statusBarHeight => ScreenUtil().statusBarHeight;

  /// 底部栏高度(mediaQuery.padding.bottom)
  double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  /// 导航栏高度(kToolbarHeight)
  double get navigationBarHeight => ScreenUtil().navigationBarHeight;

  /// 底部导航栏高度(kBottomNavigationBarHeight)
  double get bottomNavigationBarHeight =>
      ScreenUtil().bottomNavigationBarHeight;

  double get scaleWidth => ScreenUtil().scaleWidth;
  double get scaleHeight => ScreenUtil().scaleHeight;

  double setWidth(num width) => ScreenUtil().setWidth(width);
  double setHeight(num height) => ScreenUtil().setHeight(height);
  double setSp(num fontSize) => ScreenUtil().setSp(fontSize);
}

extension ScreenUtilExtension on ScreenUtil {
  /// 顶部导航栏高度，默认 kToolbarHeight
  double get navigationBarHeight => _navigationBarHeight ?? kToolbarHeight;

  /// 底部导航栏高度，默认 kBottomNavigationBarHeight
  double get bottomNavigationBarHeight =>
      _bottomNavigationBarHeight ?? kBottomNavigationBarHeight;

  /// 自定义全局顶部导航栏高度
  static void setNavigationBarHeight(double value) =>
      _navigationBarHeight = value;

  /// 自定义全局底部导航栏高度
  static void setBottomNavigationBarHeight(double value) =>
      _bottomNavigationBarHeight = value;

  static double? _navigationBarHeight;
  static double? _bottomNavigationBarHeight;
}

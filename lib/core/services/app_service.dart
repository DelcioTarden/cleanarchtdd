import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

import '../../features/countries/presentation/screens/country_screen.dart';

class AppService {
  static final AppService _service = AppService._internal();
  static AppService get instance { return _service; }
  AppService._internal();

  void finallySession(bool apagarDadosUsuario, bool sairDoApp) async {
    if (sairDoApp && Platform.isAndroid){
      SystemNavigator.pop();
    } else {
      navigatePushAndRemoveUntil( const CountryScreen());
    }
  }

  /// NAVIGATION
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateNamedTo(String routeName) async {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  Future<dynamic> navigateNamedReplacementTo(String routeName) async {
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  Future<dynamic> navigatePushReplecementTo(Widget widget, {bool animated = false}) async {
    return navigatorKey.currentState?.pushReplacement(
      !animated ? _pageRouteDefault(widget) : _pageRouteAnimated(widget),
    );
  }

  Future<dynamic> navigateTo(Widget widget, {bool animated = false}) async {
    return navigatorKey.currentState?.push(
      !animated ? _pageRouteDefault(widget) : _pageRouteAnimated(widget),
    );
  }

  Future<dynamic> navigateReplacementTo(Widget widget, {bool animated = false}) async {
    return navigatorKey.currentState?.pushReplacement(
      !animated ? _pageRouteDefault(widget) : _pageRouteAnimated(widget),
    );
  }

  Future<dynamic> navigatePushAndRemoveUntil(Widget widget, {bool animated = false}) async {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      !animated ? _pageRouteDefault(widget) : _pageRouteAnimated(widget),
      (_) {
        return false;
      },
    );
  }

  Future<dynamic> navigateFromLogin(Widget widget) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_){
          return widget;
        },
      ),
      (_) {
        return false;
      },
    );
  }

  void navigatePop([Object? object]) {
    return navigatorKey.currentState?.pop(object);
  }

  CupertinoPageRoute _pageRouteDefault(Widget widget) {
    return CupertinoPageRoute(
      builder: (_){
        return widget;
      },
    );
  }

  PageRouteBuilder _pageRouteAnimated(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  BuildContext get context {
    return navigatorKey.currentState!.context;
  }

  bool get isModoRelease { return kReleaseMode; }

  /// APP INFORMATION
  Future<String> getAppName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  Future<String> getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }
}
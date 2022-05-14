import 'package:favorcate/ui/pages/favor/favor.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:flutter/material.dart';

class HYRouter {
  static final String initialRoute = HYMainScreen.routeName; //main路由

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => HYMainScreen(),
    HYHomeScreen.routeName: (ctx) => HYHomeScreen(),
    HYFavorScreen.routeName: (ctx) => HYFavorScreen(),
  };
  static final RouteFactory generateRoute = (setting) {
    return null;
  };
  static final RouteFactory unKnownRoute = (setting) {
    return null;
  };
}
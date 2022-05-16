import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/favor/favor.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class HYRouter {
  static final String initialRoute = HYMainScreen.routeName; //main路由

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => HYMainScreen(),
    HYMealScreen.routeName: (ctx) => HYMealScreen(),
    HYDetailScreen.routeName: (ctx) => HYDetailScreen(),
  };
  //过滤界面
  static final RouteFactory generateRoute = (setting) {
    if (setting.name == HYFilterScreen.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return HYFilterScreen();
          },
          fullscreenDialog: true);
    }
    return null;
  };
  static final RouteFactory unKnownRoute = (setting) {
    return null;
  };
}

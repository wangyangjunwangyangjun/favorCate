import 'package:flutter/cupertino.dart';

import '../model/meal_model.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = [];

  HYFilterViewModel _filterVM = HYFilterViewModel();

  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners(); //这里加上更新界面
  }

  //筛选符合条件的菜品
  List<HYMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<HYMealModel> get originalMeals {
    return _meals;
  }

  set meals(List<HYMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
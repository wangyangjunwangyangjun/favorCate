import 'package:favorcate/core/viewmodel/base_view_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/cupertino.dart';

class HYFavorViewModel extends BaseMealViewModel {

  void addMeal(HYMealModel meal) {
    originalMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(HYMealModel meal) {
    originalMeals.remove(meal);
    notifyListeners();
  }

  //判断是否收藏
  bool isFavor(HYMealModel meal) {
    return originalMeals.contains(meal);
  }

  void handleMeal(HYMealModel meal) {
    if(isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}

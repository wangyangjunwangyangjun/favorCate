import 'package:flutter/material.dart';
import 'package:favorcate/core/model/meal_model.dart';

class HYFavorViewModel extends ChangeNotifier {
  List<HYMealModel> _favorMeals = [];

  void addMeal(HYMealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(HYMealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  List<HYMealModel> get favorMeals => _favorMeals;

  //判断是否收藏
  bool isFavor(HYMealModel meal) {
    return _favorMeals.contains(meal);
  }

  void handleMeal(HYMealModel meal) {
    if(isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}

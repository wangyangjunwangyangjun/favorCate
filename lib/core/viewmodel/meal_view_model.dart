import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:flutter/cupertino.dart';

class HYMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = [];


  List<HYMealModel> get meals => _meals;

  HYMealViewModel() {
    HYMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
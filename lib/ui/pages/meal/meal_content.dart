import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/pages/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../../../core/model/category_model.dart';

class HYMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //全局路由查找种类
    final category =
        ModalRoute.of(context)?.settings.arguments as HYCategoryModel;
    return Selector<HYMealViewModel, List<HYMealModel>>(
      shouldRebuild: (prev, next) {
        //列表不同需要重新执行build，相同相同需要重新build
        return !const ListEquality().equals(prev, next);
      },
      //where起到过滤作用，只有当前菜品的类别属于当前类别时，才被筛选进来
      selector: (ctx, mealVM) => mealVM.meals
          .where((meal) => meal.categories.contains(category.id))
          .toList(),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return HYMealItem(meals[index]);
          },
        );
      },
    );
    // //Consumer获取
    // return Consumer<HYMealViewModel>(builder: (ctx, mealVM, child) {
    //   //where表示过滤，如果包含当前种类的就保留
    //   final meals = mealVM.meals
    //       .where((meal) => meal.categories.contains(category.id))
    //       .toList();
    //   return ListView.builder(
    //       itemCount: meals.length,
    //       itemBuilder: (ctx, index) {
    //         return ListTile(
    //           title: Text(meals[index].title),
    //         );
    //       });
    // });
  }
}

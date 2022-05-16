import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class HYFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<HYFavorViewModel>(
      builder: (ctx, favorVM, child) {
        if (favorVM.meals.length == 0) {
          return Center(
            child: Text("未收藏美食"),
          );
        }
        return ListView.builder(
          itemCount: favorVM.meals.length,
          itemBuilder: (itemCtx, index) {
            return HYMealItem(favorVM.meals[index]);
          },
        );
      },
    );
    // return Selector<HYFavorViewModel, List<HYMealModel>>(
    //   shouldRebuild: (prev, next) {
    //     //列表不同需要重新执行build，相同相同需要重新build
    //     return !const ListEquality().equals(prev, next);
    //   },
    //   selector: (ctx, favorVM) => favorVM.meals,
    //   builder: (ctx, meals, child) {
    //     return ListView.builder(
    //       itemCount: meals.length,
    //       itemBuilder: (ctx, index) {
    //         return HYMealItem(meals[index]);
    //       },
    //     );
    //   },
    // );
  }
}

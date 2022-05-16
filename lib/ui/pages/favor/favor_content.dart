import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HYFavorContent extends StatelessWidget {
  const HYFavorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavorViewModel>(builder: (ctx, favorVM, child) {
      return ListView.builder(
        itemBuilder: (itemCtx, index) {
          if(favorVM.favorMeals.length == 0) {
            return Center(
              child: Text("未收藏美食"),
            );
          }
          return HYMealItem(favorVM.favorMeals[index]);
        },
        itemCount: favorVM.favorMeals.length,
      );
    });
  }
}

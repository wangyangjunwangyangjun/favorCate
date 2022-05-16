import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/meal_model.dart';
import '../../../core/viewmodel/favor_view_model.dart';

class HYDetailFloatingButton extends StatelessWidget {
  final HYMealModel meal;

  HYDetailFloatingButton(this.meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavorViewModel>(
      builder: (ctx, favorVM, child) {
        final iconData =
            favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;
        return FloatingActionButton(
          child: Icon(
            iconData,
            color: iconColor,
          ),
          onPressed: () {
            favorVM.handleMeal(meal);
          },
        );
      },
    );
  }
}

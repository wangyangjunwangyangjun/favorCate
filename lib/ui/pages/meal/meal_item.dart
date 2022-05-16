import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class HYMealItem extends StatelessWidget {
  final HYMealModel _meal;

  HYMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 4.px, //阴影
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(HYDetailScreen.routeName, arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          //只裁剪上边两个角
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(
            _meal.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.px,
              vertical: 5.px,
            ),
            child: Text(
              _meal.title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(4.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
          HYOperationItem(Icon(Icons.restaurant), _meal.complexityStr),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<HYFavorViewModel>(
      builder: (ctx, favorVM, child) {
        final iconData =
            favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";
        return GestureDetector(
          child: HYOperationItem(
            Icon(
              iconData,
              color: favorColor,
            ),
            title,
            textColor: favorColor,
          ),
          onTap:() {
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}

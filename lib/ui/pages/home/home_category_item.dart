import 'package:flutter/material.dart';

import '../../../core/model/category_model.dart';
class HYHomeCategoryItem extends StatelessWidget {
  final HYCategoryModel _category;

  HYHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.changedColor;
    return Container(
      decoration: BoxDecoration( //圆角
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(  //渐变色
              colors: [
                bgColor.withOpacity(.5), //半透明到全透明
                bgColor
              ]
          )
      ),
      alignment: Alignment.center,
      child: Text(
        _category.title,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(  //copyWith：在原有基础上添加属性
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
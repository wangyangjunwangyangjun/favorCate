import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HYDetailContent extends StatelessWidget {
  final HYMealModel _meal;

  HYDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  //1、横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,  //这里属性必须设置，如果图片未加载，那么Column对齐
      margin: EdgeInsets.all(5.px),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.px),
        child: Image.network(_meal.imageUrl),
      ),
    );
  }

  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        /**
         * 1、shrinkWrap：
         * true->内容多大就占据多大的高度，false->尽可能占据高度
         * 2、column嵌套LListView，Column需要ListView给出一个指定高度，
         * 这里不是局部滚动，所以不设置Height，而设置shrinkWrap
         */
        shrinkWrap: true,
        //禁止滚动
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("#${index + 1}"),
                ),
                title: Text(_meal.steps[index]),
              );
            },
            separatorBuilder: (cttx, index) {
              return Divider();
            },
            itemCount: _meal.steps.length));
  }

  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget buildMakeContent(
      {required BuildContext context, required Widget child}) {
    return Container(
        padding: EdgeInsets.all(8.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.px),
          border: Border.all(color: Colors.grey), //边框
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width - 30.px, //媒体查询，距离左右15px
        child: child);
  }
}

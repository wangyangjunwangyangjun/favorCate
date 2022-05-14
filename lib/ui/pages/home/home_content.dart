import 'package:flutter/material.dart';

import '../../../core/model/category_model.dart';
import 'package:favorcate/core/services/json_parse.dart';
import '../../../core/extension/int_extension.dart';
import '../../../core/extension/double_extension.dart';

class HYHomeContent extends StatefulWidget {
  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  List<HYCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();

    //加载json数据
    JsonParse.getCategoryData().then((value) {
      setState(() {
        _categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.px),
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //固定个数
          crossAxisCount: 2,
          crossAxisSpacing: 20.px,
          mainAxisSpacing: 20.px,
          childAspectRatio: 1.5),
      itemBuilder: (ctx, index) {
        final bgColor = _categories[index].changedColor;
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
            _categories[index].title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(  //copyWith：在原有基础上添加属性
              fontWeight: FontWeight.bold
            ),
          ),
        );
      },
    );
  }
}

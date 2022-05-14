import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/material.dart';

import 'package:favorcate/core/services/json_parse.dart';
import '../../../core/extension/int_extension.dart';
import 'home_category_item.dart';

class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HYCategoryModel>>( //泛型类
        future: HYJsonParse.getCategoryData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final categories = snapshot.data;
          return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categories?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //固定个数
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5),
            itemBuilder: (ctx, index) {
              return HYHomeCategoryItem(categories![index]);
            },
          );
        }
    );
  }
}
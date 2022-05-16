import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HYHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTile(
              context,
              Icon(Icons.restaurant),
              "进餐",
              () {
                Navigator.of(context).pop();
              },
            ),
            buildListTile(context, Icon(Icons.settings), "过滤", () {
              Navigator.of(context).pushNamed(HYFilterScreen.routeName);
            }),
          ],
        ),
      ),
      width: 250.px,
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.px),
      color: Colors.orange,
      alignment: const Alignment(0, 0.5),
      width: double.infinity,
      height: 100.px,
      child: Text(
        "开始动手",
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      onTap: handler as Function(), //这里指明类型Function
    );
  }
}

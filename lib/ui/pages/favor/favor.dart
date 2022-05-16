import 'package:favorcate/ui/pages/favor/favor_content.dart';
import 'package:flutter/material.dart';

class HYFavorScreen extends StatelessWidget {
  static const String routeName = "/favor";
  const HYFavorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: HYFavorContent()
    );
  }
}

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
      body: Center(
        child: Text("我的收藏"),
      ),
    );
  }
}

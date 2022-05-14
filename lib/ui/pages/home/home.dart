import 'package:flutter/material.dart';

import 'home_content.dart';

class HYHomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: HYHomeContent()
    );
  }
}
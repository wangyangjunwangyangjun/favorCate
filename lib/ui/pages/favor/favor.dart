import 'package:favorcate/ui/pages/favor/favor_content.dart';
import 'package:flutter/material.dart';

class HYFavorScreen extends StatelessWidget {
  static const String routeName = "/favor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ζηζΆθ"),
      ),
      body: HYFavorContent()
    );
  }
}

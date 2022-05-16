import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar {
  HYHomeAppBar(BuildContext context)
      : super(
          title: const Text("美食广场"),
          leading: IconButton(
            icon: const Icon(Icons.build),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        );
}

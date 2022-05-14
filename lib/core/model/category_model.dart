import 'package:flutter/cupertino.dart';

class HYCategoryModel {
  String id = "";
  String title = "";
  String color = "";
  Color changedColor = const Color.fromARGB(255, 255, 255, 255);

  HYCategoryModel({required this.id, required this.title, required this.color});

  HYCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    /**
     * 1、将color转成十六进制数字
     * 2、透明度加上（或运算符，留下后六位，前两位FF拼上）
     */
    final colorInt = int.parse(color, radix: 16);
    changedColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
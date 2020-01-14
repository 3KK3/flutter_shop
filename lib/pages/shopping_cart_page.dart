import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  
  List<String> list = [];
  
  // 增加数据
  void add() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String str = "234234";
    // 增加和修改使用set
    preferences.setStringList("ShoppingCartPage", list);
  }

  // 获取数据
    Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String str = "234234";
    if (preferences.getStringList(str) != null) {
      return preferences.getStringList(str);
    } else {
      return null;
    }
  }

  // 删除数据
  void delete() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String str = "234234";
    if (preferences.getStringList(str) != null) {
       preferences.remove(str);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

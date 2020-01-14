import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';

class CategotyPage extends StatefulWidget {
  @override
  _CategotyPageState createState() => _CategotyPageState();
}

class _CategotyPageState extends State<CategotyPage> {

  void _getCategory() async {
    await request("category").then((val) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// -------- 左侧类别导航-------

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

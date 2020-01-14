import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {

  final String goodsID;

  DetailPage(this.goodsID);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("商品ID： ${goodsID}"),
      ),
    );
  }
}

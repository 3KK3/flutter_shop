import 'package:flutter/material.dart';
import 'package:flutter_shop/route/routers.dart';
import 'pages/index_page.dart';
import 'package:fluro/fluro.dart';
import 'route/application.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        onGenerateRoute: Application.router.generator, // 配置路由
        title: "百姓生活+",
        // 去掉debug字
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}

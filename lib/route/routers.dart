import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(

        handlerFunc:(BuildContext context, Map<String, List<String>> map) {
          print("not founde route");
        }
    );
    router.define(detailsPage, handler: detailsHandler);
  }

}
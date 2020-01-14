import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

// 获取首页主题内容
Future getHomePageConatent() async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    var formData = {"lon": '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath["homePageContent"], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('请求异常');
    }
  } catch (e) {
    return print(e);
  }
}

// 获取分类页面商品
Future request(String) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    var formData = {"lon": '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath["homePageContent"], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('请求异常');
    }
  } catch (e) {
    return print(e);
  }
}
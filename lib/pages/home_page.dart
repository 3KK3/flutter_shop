import 'dart:js';

import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../route/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  String homePageContent = "正在获取数据";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getHomePageConatent().then((data){
      setState(() {
        homePageContent = data.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        future: getHomePageConatent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['sliders'] as List).cast();
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            String leaderImg = data['data']['iamge'];
            String leaderPhone = data['data']['phone'];

            return SingleChildScrollView( // 可滚动
              child:  Column(
                  children: <Widget>[
                  SwiperDiy(swiperDataList: swiper),
                  TopNavigator(navigatorList: navigatorList),
                  LeaderPhone(leaderPhone: leaderPhone, leaderImage: leaderImg);
                ],
              )
            );
          } else {
            return Center(child: Text("haahahahahah"),);
          }
        },

      ),

    );
  }
}

// ------------  轮播组件  ------------

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]['image']}");
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        autoplay: true,

      ),
    );
  }
}

// --------------  菜单导航列表 ---------------

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) :super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (){
        print("点击了");

        // 路由
        Application.router.navigateTo(context, '/detail?id=${item["goodsID"]}');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95),),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }),
      ),
    );
  }
}

// ----------- 图片拨打电话--------- 

class LeaderPhone extends StatelessWidget {
  final String leaderPhone;
  final String leaderImage;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}): super(key:key);

  void launcherUrl() async {
    String tel = 'tel' + leaderPhone;
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw "不能拨打电话";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: InkWell(
        onTap: (){

        },
        child: Image.network(leaderImage),

      ),

    );
  }
}

// -----------  横向列表 -------------
class Recommend extends StatelessWidget {

  final List recommendList;

  Recommend({this.recommendList});

  Widget item(index) {
    return InkWell(
      onTap: (){



      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]["recommend"]),
            Text("￥${recommendList[index]["price"]}"),
            Text(
                "￥${recommendList[index]["subprice"]}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough, // 删除线
                color: Colors.grey
              ),
            ),
          ],
          
        ),
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
      ),
    );
  }


  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
          return item(index);
          }
      ),
      
    );
    
  }
  
  
  Widget titleWidget() {
    return Container(
      child: Text(
        "section标题",
        style: TextStyle(
          color: Colors.pink
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 2, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border( // 分割线
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        ),


      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          titleWidget(),
          _recommendList()
        ],

      ),
    );
  }
}



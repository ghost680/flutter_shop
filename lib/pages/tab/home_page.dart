import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../components/swiper_component.dart';
import '../home/topNavigator.dart';
import '../home/recommend.dart';
import '../home/floor_widget.dart';
import '../home/hot_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  int page = 1;
  Map hotList = {};
  @override
  void initState() {
    super.initState();
    _getHotData(this.page);
  }

  void _getHotData(page) {
    queryHotList({"page": page}).then((value) {
      setState(() {
        hotList = value['list'];
        print(hotList);
        page++;
      });
    });
  }

  @override
  bool get wantKeepAlive =>true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      body: FutureBuilder(
        future: queryHomeSlides(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map> swiperData = (snapshot.data['data']['slides'] as List).cast();
            List<Map> navigatorData = (snapshot.data['data']['category'] as List).cast();
            List<Map> recommendList = (snapshot.data['data']['recommend'] as List).cast();
            List<Map> floorList = (snapshot.data['data']['floors'] as List).cast();
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SwiperComponent(swiperDataList: swiperData),
                    TopNavigator(navigatorList: navigatorData),
                    RecommendWidget(recommendList: recommendList),
                    FloorWidget(floorData: floorList[0]),
                    FloorWidget(floorData: floorList[1]),
                    FloorWidget(floorData: floorList[2]),
                    HotWidget(hotList: hotList),
                  ]
                )
              )
            );
          } else {
            return Center(
              child: Text('加载中...')
            );
          }
        }
      )
    );
  }
}

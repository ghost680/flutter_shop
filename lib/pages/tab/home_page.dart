import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
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
  List<Map> hotList = [];
  
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    print('*****************');
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
              child: EasyRefresh(
                child: ListView(
                  children: <Widget>[
                    SwiperComponent(swiperDataList: swiperData),
                    TopNavigator(navigatorList: navigatorData),
                    RecommendWidget(recommendList: recommendList),
                    FloorWidget(floorData: floorList[0]),
                    FloorWidget(floorData: floorList[1]),
                    FloorWidget(floorData: floorList[2]),
                    HotWidget(hotList: hotList),
                  ],
                ),
                onRefresh: () async {

                },
                loadMore: () async {
                  // 加载更多
                  if(page <= 4){
                    queryHotList({"page": page}).then((json) {             
                      List<Map> newGoodsList = (json['list'] as List ).cast();
                      print(newGoodsList);
                      setState(() {
                        hotList.addAll(newGoodsList);
                        page++;
                      });
                    });
                  }
                },
                refreshHeader: MaterialHeader(key: _headerKey),
                refreshFooter: MaterialFooter(key: _footerKey),
              ),
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

import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../components/swiper_component.dart';
import '../home/topNavigator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
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
            List swiperData = snapshot.data['data']['slides'];
            List navigatorData = snapshot.data['data']['category'];
            print(navigatorData);
            return Container(
              child: Column(
                children: <Widget>[
                  SwiperComponent(swiperDataList: swiperData),
                  TopNavigator(navigatorList: navigatorData)
                ],
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

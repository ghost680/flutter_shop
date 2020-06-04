import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../components/swiper_component.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: queryHomeSlides(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List swiperData = snapshot.data['data']['slides'];
            return Container(
              child: SwiperComponent(swiperDataList: swiperData)
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

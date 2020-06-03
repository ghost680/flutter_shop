import 'package:flutter/material.dart';
import '../../service/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    getUserinfo().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(data != null) {
      return Scaffold(
          body: Center(
        child: Text('${data["data"]["username"]}'),
      ));
    }
    return Container(
      child: Text('暂无数据'),
    );
  }
}
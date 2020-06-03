import 'dart:convert';

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
    return Scaffold(
        body: FutureBuilder(
            future: getUserinfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                //var data = jsonDecode(snapshot.data.toString());
                //print(data['data']);
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('${snapshot.data["data"]["username"]}'),
                      Text('${snapshot.data["data"]["sex"]}'),
                      Text('${snapshot.data["data"]["age"]}'),
                      Text('${snapshot.data["data"]["telephone"]}'),
                      Text('${snapshot.data["data"]["cardId"]}'),
                    ],
                  ),
                );
              } else {
                return Center(child: Text('加载中...'));
              }
            }));
  }
}

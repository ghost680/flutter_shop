import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './keep_alive_demo.dart';


class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin{
  TabController _controller;
  
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('糖果商城'),
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon:Icon(Icons.directions_car)),
            Tab(icon:Icon(Icons.directions_transit)),
            Tab(icon:Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
         MyHomePage(),
         MyHomePage(),
         MyHomePage()
        ],
      )
    );
  }
}
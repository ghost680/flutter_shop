import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList;
  const TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Container(
      height: 320.h,
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }

  _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (){
        print('点击导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: 95.w),
          Text(item['mallCategoryName'])
        ]
      )
    );
  }
}
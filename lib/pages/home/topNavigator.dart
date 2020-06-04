import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList;
  const TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
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

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (){
        print('点击导航');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(item['image'], width: 100.w, height: 100.h),
          Text(
            item['title'], 
            style: TextStyle(
              fontSize: 28.sp,
              color: Colors.grey,
            )
          )
        ]
      )
    );
  }
}
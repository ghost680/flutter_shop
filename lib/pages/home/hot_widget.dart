import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotWidget extends StatelessWidget {
  final Map hotList;
  const HotWidget({Key key, this.hotList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitleWidget(hotList['title']),
          _hotListWidget(hotList['hotData'])
        ]
      ),
    );
  }

  // 标题组件
  Widget _hotTitleWidget(String title) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      color: Colors.white,
      alignment: Alignment.center,
      width: double.infinity,
      height: 80.h,
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: 32.sp,
          color: Colors.grey
        ),
      ),
    );
  }

  // 列表widget
  Widget _hotListWidget(data) {
    if(data.length != 0) {
      return Container(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 20.w,
          runSpacing: 20.h,
          children: data.map<Widget>((item) => _hotGoodsItemUI(item)).toList(),
        ),
      );
    } else {
      return Text('没有更多了数据');
    }
  }

  // 内容widget
  Widget _hotGoodsItemUI(item) {
    return InkWell(
      onTap: () { print('点击了一下'); },
      child: Container(
        width: 350.w,
        child: Column(
          children: <Widget>[
            Image.network(item['image'], width: 350.w, height: 300.h, fit: BoxFit.fill),
            Text(
              "${item['name']}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.pink,
                fontSize: 26.sp
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('￥${item['mallPrice']}'),
                Text(
                  '￥${item['price']}',
                  style: TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}
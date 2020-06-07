import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotWidget extends StatelessWidget {
  final List hotList;
  const HotWidget({Key key, this.hotList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitleWidget(),
          _hotListWidget(hotList)
        ]
      ),
    );
  }

  // 标题组件
  Widget _hotTitleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      color: Colors.white,
      alignment: Alignment.center,
      width: double.infinity,
      height: 80.h,
      child: Text(
        "火爆专区",
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
      print('############################');
      print(data.length);
      print('############################');
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
              "${item['title']}",
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendWidget extends StatelessWidget {
  final List recommendList;
  const RecommendWidget({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410.h,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList(),
        ],
      ),
    );
  }

  // 推荐商品标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 80.h,
      padding: EdgeInsets.only(left: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink, fontSize: 28.sp),
      ),
    );
  }

  // 横向滚动部件
  Widget _recommendList() {
    return Container(
      height: 330.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        }
      )
    );
  }

  // 单个商品
  Widget _item(index) {
    return InkWell(
      onTap: (){ print('您点击了商品'); },
      child: Container(
        width: 250.w,
        height: 330.h,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image'], width: 250.w, height: 200.h),
            SizedBox(height: 20.h),
            Text(
              '￥${recommendList[index]["mallPrice"]}',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 28.sp
              )
            ),
            Text(
              '${recommendList[index]["price"]}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 24.sp
              )
            )
          ]
        ),
      ),
    );
  }
  
}
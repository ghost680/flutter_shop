import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorWidget extends StatelessWidget {
  final Map floorData;
  const FloorWidget({Key key, this.floorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _floorTitleWidget(floorData['floor_pic']),
          _floorContentWidget(floorData['floor_list'])
        ],
      ),
    );
  }

  // 楼层title
  Widget _floorTitleWidget(image) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Image.network(image),
    );
  }

  // 楼层内容区域
  Widget _floorContentWidget(floorList) {
    return Container (
      child: Column(
        children: <Widget>[
          _floorContentRow1Widget(floorList),
          _floorContentRow2Widget(floorList)
        ],
      ),
    );
  }

  // 楼层内容第一行
  Widget _floorContentRow1Widget(floorList) {
    return Container(
      width: double.infinity,
      height: 300.h,
      child: Row(
        children: <Widget>[
          _floorGoodsFirstItemUI(floorList[0]['image']),
          Column(
            children: <Widget>[
              _floorGoodsItemUI(floorList[1]['image']),
              _floorGoodsItemUI(floorList[2]['image'])
            ],
          )
        ]
      ),
    );
  }

  // 楼层内容第二行
  Widget _floorContentRow2Widget(floorList) {
    return Container(
      child: Row(
        children: <Widget>[
          _floorGoodsItemUI(floorList[3]['image']),
          _floorGoodsItemUI(floorList[4]['image'])
        ]
      ),
    );
  }

  // 楼层商品UI
  Widget _floorGoodsItemUI(goodsData) {
    return Container(
      width: 375.w,
      height: 150.h,
      child: InkWell(
        onTap: () { print('你点我干啥'); },
        child: Image.network(goodsData, fit: BoxFit.fill, width: 375.w, height: 150.h),
      )
    );
  }
  Widget _floorGoodsFirstItemUI(goodsData) {
    return Container(
      width: 375.w,
      height: 300.h,
      child: InkWell(
        onTap: () { print('你点我干啥'); },
        child: Image.network(goodsData),
      )
    );
  }
}
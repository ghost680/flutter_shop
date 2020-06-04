import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperComponent extends StatelessWidget {
  final List swiperDataList;
  const SwiperComponent({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 750.w,
      height: 350.h,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network('${swiperDataList[index]["image"]}', fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
        autoplay: true
      ),
    );
  }
}
import './http_service.dart';
import '../conf/service_url.dart';

// 获取用户信息
Future queryHomeSlides() async {
  return await request(ServicePath.queryHome, type: "GET");
}

// 查询火爆专区数据
Future queryHotList(formData) async {
  print(formData);
  return await request(ServicePath.queryHotList, formData: formData, type: "GET");
}
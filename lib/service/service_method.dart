import './http_service.dart';
import '../conf/service_url.dart';

// 获取用户信息
Future queryHomeSlides() async {
  return await request(ServicePath.queryHomeSlides);
}

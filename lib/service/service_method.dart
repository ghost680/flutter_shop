import './http_service.dart';
import '../conf/service_url.dart';

// 获取用户信息
Future getUserinfo() async {
  var resp = await request(ServicePath.queryUserInfo, formData: {"userId": "111111"});
  return resp;
}

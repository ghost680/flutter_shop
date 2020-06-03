import 'dart:async';
import 'package:dio/dio.dart';

// dio 请求方法封装
Future request(url, {formData, type: 'POST'}) async{
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    // 根据用户配置发起对应请求，传入url及表单参数
    if(type == 'POST'){
      response = await dio.post(url, data: formData);
    } if(type == 'GET') {
      response = await dio.get(url, queryParameters: formData);
      print(url);
      print(formData);
    }

    // 处理返回结果
    if(response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常，请检测服务器运行状况');
    }

  } catch (e) {
    return print('error::::$e');
  }
}


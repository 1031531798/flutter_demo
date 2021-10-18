import 'package:dio/dio.dart';

const String BASEURL = "http://139.196.74.115:8796";

class HTTPConfig {
  static const baseURL = BASEURL;
  static const timeout = 5000;
}

class NodeRequest {
  // dio配置参数
  static final BaseOptions options = BaseOptions(
      baseUrl: HTTPConfig.baseURL, connectTimeout: HTTPConfig.timeout);
  static final Dio dio = Dio(options);
  static get (url) async {
    Map dataNews;
    Response response = await dio.get(url);
    return response;
  }
  static post (url, Map? data) async {
    Response response = await dio.post(url);
    return response;
  }
  static request(String url,
      {String method = 'get',
      Map<String, dynamic>? params,
      Interceptor? inter}) async {
    final option = Options(method: method);
    // 2.添加第一个拦截器
    Interceptor dInter = InterceptorsWrapper(
        //请求拦截器
        onRequest:(options, handler){
          print('请求拦截');
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          return  handler.next(e);//continue
        }
    );
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response;
      if (method == 'get') {
        if (params != null && params.length > 0) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
        return response.data;
      } else if (method == 'post') {
        if (params != null && params.length > 0) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
        return response.data;
      }
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

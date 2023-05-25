import 'package:dio/dio.dart';
import 'package:flutter_demo/http/options.dart';


class HttpRequest {
  // 单例模式使用Http类，
  static final HttpRequest _instance = HttpRequest._internal();

  factory HttpRequest() => _instance;

  static late final Dio dio;

  /// 内部构造方法
  HttpRequest._internal() {
    /// 初始化dio
    BaseOptions options = BaseOptions(
        connectTimeout: HttpOptions.connectTimeout,
        receiveTimeout: HttpOptions.receiveTimeout,
        sendTimeout: HttpOptions.sendTimeout,
        baseUrl: HttpOptions.baseUrl
      );

    dio = Dio(options);
    //dio.interceptors.add(LogInterceptor(responseBody: true)); //是否开启请求日志  Global.isDebug
    /// 添加各种拦截器
    // dio.interceptors.add(ErrorInterceptor());
  }

  /// 封装request方法
  Future request({
    required String path, //接口地址
    required HttpMethod method, //请求方式
    dynamic data, //数据
    Map<String, dynamic>? queryParameters,
    bool showLoading = true, //加载过程
    bool showErrorMessage = true, //返回数据
  }) async {
    const Map methodValues = {
      HttpMethod.get: 'get',
      HttpMethod.post: 'post',
      HttpMethod.put: 'put',
      HttpMethod.delete: 'delete',
      HttpMethod.patch: 'patch',
      HttpMethod.head: 'head'
    };

    //动态添加header头
    Map<String, dynamic> headers = <String, dynamic>{};
    headers['Authorization'] = 'Bearer e210f3ea4fb94ae886335e54ffd748d21';
    Options options = Options(
      method: methodValues[method],
      // responseType: ResponseType.json,
      headers: headers,
    );

    try {
      Response response = await HttpRequest.dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (error) {
      print('******$error');
    } finally {

    }
  }
}

enum HttpMethod {
  get,
  post,
  delete,
  put,
  patch,
  head,
}

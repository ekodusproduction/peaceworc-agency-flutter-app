import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/api/multipart_token_interceptor.dart';
import 'package:peaceworc_agency/api/token_interceptor.dart';

class ApiClient{
  static Dio? _dio;
  static Dio? http() {
    if (_dio == null) {
      _dio = new Dio();
      _dio!.options.baseUrl = ApiLinks.BASE_URL;
      _dio!.interceptors.add(LogInterceptor(responseBody: true));
    }
    return _dio;
  }

  static Dio? httpWithToken() {
    if (_dio == null) {
      _dio = new Dio();
      _dio!.options.baseUrl = ApiLinks.BASE_URL;
      _dio!.interceptors.add(TokenInterceptor());
      _dio!.interceptors.add(LogInterceptor(responseBody: true));
    }
    return _dio;
  }

  static Dio? httpMultipartWithToken() {
    if (_dio == null) {
      _dio = new Dio();
      _dio!.options.baseUrl = ApiLinks.BASE_URL;
      _dio!.interceptors.add(MultipartTokenInterceptor());
      _dio!.interceptors.add(LogInterceptor(responseBody: true));
    }
    return _dio;
  }

  static dispose() {
    if (_dio != null) _dio!.close();
  }
}


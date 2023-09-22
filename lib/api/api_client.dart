import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_links.dart';

class ApiClient{
  static Dio? _dio;
  static Dio? http() {
    if (_dio == null) {
      //print('Creating new instance');
      _dio = new Dio();
      _dio!.options.baseUrl = ApiLinks.BASE_URL;
      // _dio.interceptors.add(TokenInterceptor(dio: _dio));
      _dio!.interceptors.add(LogInterceptor(responseBody: true));
    }
    //print('Has instance');
    return _dio;
  }

  static dispose() {
    if (_dio != null) _dio!.close();
  }
}
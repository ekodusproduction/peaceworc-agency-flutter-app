import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultipartTokenInterceptor extends Interceptor {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _prefs.then((SharedPreferences prefs) {
      final token = prefs.getString("auth_token")!;
      if(token != null && token.isNotEmpty){
        options.headers['Authorization'] = 'Bearer $token';
      }
      options.headers['Content-Type'] = 'multipart/form-data';
    });
    super.onRequest(options, handler);
  }
}
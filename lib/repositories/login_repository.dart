import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/login/LoginResponse.dart';

class LoginRepository{
  Future<LoginResponse> login(String email, password, fcmToken) async {
    LoginResponse _login;
    final _apiClient = ApiClient.http();
    var params = {'email': email, 'password': password, 'fcm_token': fcmToken};

    try {
      Response response = await _apiClient!.post(ApiLinks.login, queryParameters: params);
      _login = LoginResponse.fromJson(response.data);
    } on DioError catch (e){
      // DioError dioError = e;
      // print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      _login = LoginResponse.withError(e.message);
      // throw Exception(e);
    }

    return _login;
  }
}
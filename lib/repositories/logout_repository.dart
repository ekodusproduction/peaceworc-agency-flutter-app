import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/logout/LogoutResponse.dart';

class LogoutRepository{
  Future<LogoutResponse> logout(String token) async {
    LogoutResponse _login;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.post(ApiLinks.logout);
      _login = LogoutResponse.fromJson(response.data);
    } on DioError catch (e){
      // DioError dioError = e;
      // print('THERE IS SOME ERROR IN NETWORK CALL.. ERROR => ${e.error.toString()} and MESSAGE => ${e.message}');
      _login = LogoutResponse.withError(e.message);
      // throw Exception(e);
    }

    return _login;
  }
}
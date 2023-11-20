import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/signup/signup_response.dart';

import '../api/api_client.dart';
import '../api/api_links.dart';

class SignUpRepository{
  Future<SignUpResponse> signUp(String company_name, name, email, password, confirm_password, fcm_token) async {
    SignUpResponse _signup;
    final _apiClient = ApiClient.http();
    try {
      Response response = await _apiClient!.post('${ApiLinks.signup}', queryParameters: {
        'company_name': company_name,
        'name': name,
        'email': email,
        'password': password,
        'confirm_password': confirm_password,
        'fcm_token': fcm_token
      });
      _signup = SignUpResponse.fromJson(response.data);
    } on DioError catch (e){
      _signup = SignUpResponse.withError(e.message);
    }

    return _signup;
  }
}
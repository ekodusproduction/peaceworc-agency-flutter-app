import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/sign_up_verify_otp/sign_up_verify_otp_response.dart';
import '../api/api_client.dart';
import '../api/api_links.dart';

class SignUpVerifyOtpRepository{
  Future<SignUpVerifyOtpResponse> verifyOtp(String email, String otp, String company_name) async {
    SignUpVerifyOtpResponse _response;
    final _apiClient = ApiClient.http();
    try {
      Response response = await _apiClient!.post('${ApiLinks.verifyOtp}', queryParameters: {
        'email' : email,
        'otp' : otp,
        'company_name' : company_name
      });
      _response = SignUpVerifyOtpResponse.fromJson(response.data);
    } on DioError catch (e){
      _response = SignUpVerifyOtpResponse.withError(e.message);
    }
    return _response;
  }
}
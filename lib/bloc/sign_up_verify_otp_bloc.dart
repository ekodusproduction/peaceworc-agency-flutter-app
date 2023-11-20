import 'package:peaceworc_agency/model/sign_up_verify_otp/sign_up_verify_otp_response.dart';
import 'package:peaceworc_agency/repositories/sign_up_verify_otp_repository.dart';
import 'package:rxdart/rxdart.dart';

class SignUpVerifyOtpBloc{
  final SignUpVerifyOtpRepository _repo = SignUpVerifyOtpRepository();
  final BehaviorSubject<SignUpVerifyOtpResponse> _behaviourSubject = BehaviorSubject<SignUpVerifyOtpResponse>();

  verifyOtp(String email, String otp, String company_name) async{
    SignUpVerifyOtpResponse response = await _repo.verifyOtp(email, otp, company_name);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<SignUpVerifyOtpResponse> get subject => _behaviourSubject;
}
final signUpVerifyOtpBloc = SignUpVerifyOtpBloc();
import 'package:peaceworc_agency/model/signup/signup_response.dart';
import 'package:peaceworc_agency/repositories/signup_repository.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc{
  final SignUpRepository _repo = SignUpRepository();
  final BehaviorSubject<SignUpResponse> _behaviourSubject = BehaviorSubject<SignUpResponse>();

  signUp(String company_name, name, email, password, confirm_password, fcm_token) async{
    SignUpResponse response = await _repo.signUp(company_name, name, email, password, confirm_password, fcm_token);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<SignUpResponse> get subject => _behaviourSubject;
}
final signUpBloc = SignUpBloc();
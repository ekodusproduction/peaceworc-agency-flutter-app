import 'package:peaceworc_agency/model/login/LoginResponse.dart';
import 'package:peaceworc_agency/repositories/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc{
  final LoginRepository _loginRepo = LoginRepository();
  final BehaviorSubject<LoginResponse> _behaviourSubject = BehaviorSubject<LoginResponse>();

  login(String email, String password, String fcmToken) async{
    LoginResponse response = await _loginRepo.login(email,password,fcmToken);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<LoginResponse> get subject => _behaviourSubject;
}
final loginBloc = LoginBloc();
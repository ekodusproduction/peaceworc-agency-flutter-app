import 'package:peaceworc_agency/model/logout/LogoutResponse.dart';
import 'package:peaceworc_agency/repositories/logout_repository.dart';
import 'package:rxdart/rxdart.dart';

class LogoutBloc{
  final LogoutRepository _loginRepo = LogoutRepository();
  final BehaviorSubject<LogoutResponse> _behaviourSubject = BehaviorSubject<LogoutResponse>();

  logout(String token) async{
    LogoutResponse response = await _loginRepo.logout(token);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<LogoutResponse> get subject => _behaviourSubject;
}
final logoutBloc = LogoutBloc();
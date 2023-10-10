import 'package:peaceworc_agency/model/get_client/get_client_response.dart';
import 'package:peaceworc_agency/repositories/get_client_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetClientBloc{
  final GetClientRepository _repo = GetClientRepository();
  final BehaviorSubject<GetClientResponse> _behaviourSubject = BehaviorSubject<GetClientResponse>();

  getClient() async{
    GetClientResponse response = await _repo.getClient();
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetClientResponse> get subject => _behaviourSubject;
}
final getClientBloc = GetClientBloc();
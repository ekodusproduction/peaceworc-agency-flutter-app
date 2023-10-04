import 'package:peaceworc_agency/model/search_client/search_client_response.dart';
import 'package:peaceworc_agency/repositories/search_client_repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchClientBloc{
  final SearchClientRepository _loginRepo = SearchClientRepository();
  final BehaviorSubject<SearchClientResponse> _behaviourSubject = BehaviorSubject<SearchClientResponse>();

  searchClient(String name) async{
    SearchClientResponse response = await _loginRepo.searchClient(name);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<SearchClientResponse> get subject => _behaviourSubject;
}
final searchClientBloc = SearchClientBloc();
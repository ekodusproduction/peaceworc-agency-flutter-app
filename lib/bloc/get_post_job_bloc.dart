import 'package:peaceworc_agency/model/post_job/get_post_job_response.dart';
import 'package:peaceworc_agency/repositories/get_post_job_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetPostJobBloc{
  final GetPostJobRepository _loginRepo = GetPostJobRepository();
  final BehaviorSubject<GetPostJobResponse> _behaviourSubject = BehaviorSubject<GetPostJobResponse>();

  getJob(String id, String page) async{
    GetPostJobResponse response = await _loginRepo.getPostJob(id,page);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetPostJobResponse> get subject => _behaviourSubject;
}
final getPostJobBloc = GetPostJobBloc();
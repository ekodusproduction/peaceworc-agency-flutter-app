import 'package:peaceworc_agency/model/get_completed_job/get_completed_jobs_response.dart';
import 'package:peaceworc_agency/repositories/get_completed_jobs_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetCompletedJobsBloc{
  final GetCompletedJobsRepository _repo = GetCompletedJobsRepository();
  final BehaviorSubject<GetCompletedJobsResponse> _behaviourSubject = BehaviorSubject<GetCompletedJobsResponse>();

  getCompletedJobs(int id, int page) async{
    GetCompletedJobsResponse response = await _repo.getCompletedJobs(id, page);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetCompletedJobsResponse> get subject => _behaviourSubject;
}
final getCompletedJobsBloc = GetCompletedJobsBloc();
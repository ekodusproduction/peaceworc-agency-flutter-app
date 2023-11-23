import 'package:peaceworc_agency/model/get_incomplete_job/get_incomplete_job_response.dart';
import 'package:peaceworc_agency/repositories/get_incomplete_job_repository.dart';
import 'package:rxdart/rxdart.dart';
class GetInCompleteJobBloc{
  final GetInCompleteJobRepository _repo = GetInCompleteJobRepository();
  final BehaviorSubject<GetInCompletedJobsResponse> _behaviourSubject = BehaviorSubject<GetInCompletedJobsResponse>();

  getInCompletedJobs() async{
    GetInCompletedJobsResponse response = await _repo.getIncompleteJob();
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetInCompletedJobsResponse> get subject => _behaviourSubject;
}
final getInCompleteJobBloc = GetInCompleteJobBloc();
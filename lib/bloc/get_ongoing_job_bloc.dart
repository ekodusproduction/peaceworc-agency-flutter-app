import 'package:peaceworc_agency/model/get_ongoing_job/get_ongoing_job_response.dart';
import 'package:peaceworc_agency/repositories/get_ongoing_job_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetOngoingJobBloc{
  final GetOngoingJobRepository _repo = GetOngoingJobRepository();
  final BehaviorSubject<GetOngoingJobResponse> _behaviourSubject = BehaviorSubject<GetOngoingJobResponse>();

  getJob(int id) async{
    GetOngoingJobResponse response = await _repo.getOngoingJob(id);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetOngoingJobResponse> get subject => _behaviourSubject;
}
final getOngoingJobBloc = GetOngoingJobBloc();
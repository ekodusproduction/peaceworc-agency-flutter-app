import 'package:peaceworc_agency/model/get_upcomming_job/get_upcomming_job_response.dart';
import 'package:peaceworc_agency/repositories/get_upcomming_job_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetUpommingJobBloc{
  final GetUpcommingJobRepository _repo = GetUpcommingJobRepository();
  final BehaviorSubject<GetUpcommingJobResponse> _behaviourSubject = BehaviorSubject<GetUpcommingJobResponse>();

  getJob(int id) async{
    GetUpcommingJobResponse response = await _repo.getUpcommingJob(id);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetUpcommingJobResponse> get subject => _behaviourSubject;
}
final getUpommingJobBloc = GetUpommingJobBloc();
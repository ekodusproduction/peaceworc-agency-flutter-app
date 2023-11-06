import 'package:peaceworc_agency/model/create_job/create_job.dart';
import 'package:peaceworc_agency/repositories/create_job_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/create_job/client_info_model.dart';

class CreateJobBloc{
  final CreateJobRepository _repo = CreateJobRepository();
  final BehaviorSubject<CreateJobResponse> _behaviourSubject = BehaviorSubject<CreateJobResponse>();

  createJob(
      String client_id,
      String title,
      String care_type,
      List<ClientInfoModel> care_items,
      String start_date,
      String end_date,
      String start_time,
      String end_time,
      String amount,
      String address,
      String description,
      List<String>? medical_history,
      List<String>? expertise,
      List<String>? other_requirements,
      List<String>? check_list,
      String short_address,
      String lat,
      String long,
      String street,
      String city,
      String state,
      String zip_code,
      String? appartment_or_unit,
      String? floor_no,
      String country,
      ) async{
    CreateJobResponse response = await _repo.createJob(client_id, title, care_type, care_items, start_date, end_date,
      start_time, end_time, amount, address, description, medical_history, expertise, other_requirements,
      check_list, short_address, lat, long, street, city, state, zip_code, appartment_or_unit, floor_no,
      country,
    );
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<CreateJobResponse> get subject => _behaviourSubject;
}
final createJobBloc = CreateJobBloc();
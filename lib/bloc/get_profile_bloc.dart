import 'package:peaceworc_agency/model/get_profile/get_profile_response.dart';
import 'package:peaceworc_agency/repositories/get_profile_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetProfile{
  final GetProfileRepository _repo = GetProfileRepository();
  final BehaviorSubject<GetProfileResponse> _behaviourSubject = BehaviorSubject<GetProfileResponse>();

  getProfile() async{
    GetProfileResponse response = await _repo.getProfile();
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<GetProfileResponse> get subject => _behaviourSubject;
}
final getProfile = GetProfile();
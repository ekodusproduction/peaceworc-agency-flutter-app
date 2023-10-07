import 'dart:io';

import 'package:peaceworc_agency/model/create_client/create_client_response.dart';
import 'package:peaceworc_agency/repositories/create_client_repository.dart';
import 'package:rxdart/rxdart.dart';

class CreateClientBloc{
  final CreateClientRepository _repo = CreateClientRepository();
  final BehaviorSubject<CreateClientResponse> _behaviourSubject = BehaviorSubject<CreateClientResponse>();

  createClient(
      File empFace,
      String empCode,
      String email,
      String name,
      String phone,
      String address,
      String short_address,
      String street,
      String appartment_or_unit,
      String floor_no,
      String city,
      String zip_code,
      String state,
      String country,
      String lat,
      String long,
      String age,
      String gender
      ) async{
    CreateClientResponse response = await _repo.createClient(
      empFace, empCode, email, name,phone,address,short_address,street,appartment_or_unit,floor_no,city,zip_code,state,country,lat,long,age,gender
    );
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<CreateClientResponse> get subject => _behaviourSubject;
}
final createClientBloc = CreateClientBloc();
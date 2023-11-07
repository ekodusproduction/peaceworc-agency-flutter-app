import 'dart:convert';

import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/create_job/create_job.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import '../model/create_job/client_info_model.dart';

class CreateJobRepository{
  Future<CreateJobResponse> createJob(
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
      ) async {
    CreateJobResponse _searchClient;
    final _apiClient = ApiClient.httpWithToken();
    try {
      print("medical his => ${jsonEncode(json.decode(json.encoder.convert(medical_history).replaceAll(r"\'", "'")))}");
      Response response = await _apiClient!.post('${ApiLinks.createJob}', queryParameters: {
        'client_id' : client_id,
        'title' : title,
        'care_type' : care_type,
        'care_items' : json.decode(json.encoder.convert(care_items).replaceAll(r"\'", "'")),
        'start_date' : start_date,
        'end_date' : end_date,
        'start_time' : start_time,
        'end_time' : end_time,
        'amount' : amount,
        'address' : address,
        'description' : description,
        'medical_history' : jsonEncode(json.decode(json.encoder.convert(medical_history).replaceAll(r"\'", "'"))),
        'expertise' : expertise,
        'other_requirements' : other_requirements,
        'check_list' : check_list,
        'short_address' : short_address,
        'lat' : lat,
        'long' : long,
        'street' : street,
        'city' : city,
        'state' : state,
        'zip_code' : zip_code,
        'appartment_or_unit' : appartment_or_unit,
        'floor_no' : floor_no,
        'country' : country,
      });
      _searchClient = CreateJobResponse.fromJson(response.data);
    } on DioError catch (e){
      _searchClient = CreateJobResponse.withError(e.message);
    }

    return _searchClient;
  }
}
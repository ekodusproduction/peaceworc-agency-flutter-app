import 'dart:io';

import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/create_client/create_client_response.dart';

class CreateClientRepository{
  Future<CreateClientResponse> createClient(
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
      ) async {
    CreateClientResponse _getPostJob;
    final _apiClient = ApiClient.httpMultipartWithToken();
    try {
      var formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(empFace.path, filename: empCode),
        'email': email,
        'name': name,
        'phone': phone,
        'address': address,
        'short_address': short_address,
        'street': street,
        'appartment_or_unit': appartment_or_unit,
        'floor_no': floor_no,
        'city': city,
        'zip_code': zip_code,
        'state': state,
        'country': country,
        'lat': lat,
        'long': long,
        'age': age,
        'gender': gender,
      });

      Response response = await _apiClient!.post(
        '${ApiLinks.createClient}',
        data: formData,
      );
      _getPostJob = CreateClientResponse.fromJson(response.data);
    } on DioError catch (e){
      _getPostJob = CreateClientResponse.withError(e.message);
    }

    return _getPostJob;
  }
}
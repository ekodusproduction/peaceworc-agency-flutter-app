import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/get_profile/get_profile_response.dart';
import '../api/api_client.dart';
import '../api/api_links.dart';

class GetProfileRepository{
  Future<GetProfileResponse> getProfile() async {
    GetProfileResponse _getProfile;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getProfile}');
      _getProfile = GetProfileResponse.fromJson(response.data);
    } on DioError catch (e){
      _getProfile = GetProfileResponse.withError(e.message);
    }
    return _getProfile;
  }
}
import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/get_client/get_client_response.dart';
class GetClientRepository{
  Future<GetClientResponse> getClient() async {
    GetClientResponse _getClient;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getClient}');
      _getClient = GetClientResponse.fromJson(response.data);
    } on DioError catch (e){
      _getClient = GetClientResponse.withError(e.message);
    }

    return _getClient;
  }
}
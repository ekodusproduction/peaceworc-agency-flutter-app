import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/search_client/search_client_response.dart';

class SearchClientRepository{
  Future<SearchClientResponse> searchClient(String name) async {
    SearchClientResponse _searchClient;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.searchClient}', queryParameters: {
        'client_name' : name,
      });
      _searchClient = SearchClientResponse.fromJson(response.data);
    } on DioError catch (e){
      _searchClient = SearchClientResponse.withError(e.message);
    }

    return _searchClient;
  }
}
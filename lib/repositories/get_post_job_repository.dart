import 'package:dio/dio.dart';
import 'package:peaceworc_agency/api/api_client.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/post_job/get_post_job_response.dart';

class GetPostJobRepository{
  Future<GetPostJobResponse> getPostJob(String id, page) async {
    GetPostJobResponse _getPostJob;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getPostJob}', queryParameters: {
        'id' : id,
        'page' : page
      });
      _getPostJob = GetPostJobResponse.fromJson(response.data);
    } on DioError catch (e){
      _getPostJob = GetPostJobResponse.withError(e.message);
    }

    return _getPostJob;
  }
}
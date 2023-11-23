import 'package:peaceworc_agency/model/get_completed_job/get_completed_jobs_response.dart';
import 'package:dio/dio.dart';
import '../api/api_client.dart';
import '../api/api_links.dart';

class GetCompletedJobsRepository{
  Future<GetCompletedJobsResponse> getCompletedJobs(int id, int page) async {
    GetCompletedJobsResponse _getJob;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getCompletedJobs}', queryParameters: {
        'page': page,
        'id' : id,
      });
      _getJob = GetCompletedJobsResponse.fromJson(response.data);
    } on DioError catch (e){
      _getJob = GetCompletedJobsResponse.withError(e.message);
    }
    return _getJob;
  }
}
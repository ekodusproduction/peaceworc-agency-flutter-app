import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/get_incomplete_job/get_incomplete_job_response.dart';
import '../api/api_client.dart';
import '../api/api_links.dart';
class GetInCompleteJobRepository{
  Future<GetInCompletedJobsResponse> getIncompleteJob() async {
    GetInCompletedJobsResponse _getJob;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getInCompletedJobs}');
      _getJob = GetInCompletedJobsResponse.fromJson(response.data);
    } on DioError catch (e){
      _getJob = GetInCompletedJobsResponse.withError(e.message);
    }
    return _getJob;
  }
}
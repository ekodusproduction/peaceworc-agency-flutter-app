import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/get_ongoing_job/get_ongoing_job_response.dart';

import '../api/api_client.dart';
import '../api/api_links.dart';

class GetOngoingJobRepository{
  Future<GetOngoingJobResponse> getOngoingJob(int id) async {
    GetOngoingJobResponse _getJob;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getOngoingJob}', queryParameters: {
        'id' : id,
      });
      _getJob = GetOngoingJobResponse.fromJson(response.data);
    } on DioError catch (e){
      _getJob = GetOngoingJobResponse.withError(e.message);
    }

    return _getJob;
  }
}
import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/get_upcomming_job/get_upcomming_job_response.dart';

import '../api/api_client.dart';
import '../api/api_links.dart';

class GetUpcommingJobRepository{
  Future<GetUpcommingJobResponse> getUpcommingJob(int id) async {
    GetUpcommingJobResponse _getJob;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.get('${ApiLinks.getUpcomming}', queryParameters: {
        'id' : id,
      });
      _getJob = GetUpcommingJobResponse.fromJson(response.data);
    } on DioError catch (e){
      _getJob = GetUpcommingJobResponse.withError(e.message);
    }

    return _getJob;
  }
}
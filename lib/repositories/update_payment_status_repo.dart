import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:peaceworc_agency/model/update_payment/update_payment_status.dart';

import '../api/api_client.dart';
import '../api/api_links.dart';

class UpdatePaymentStatusRepository{
  Future<UpdatePaymentStatusResponse> updatePayment(int job_id, String amount, String customer_id, String caregiver_charge, String peaceworc_percentage, String peaceworc_charge, int payment_status) async {
    UpdatePaymentStatusResponse _response;
    final _apiClient = ApiClient.httpWithToken();
    try {
      Response response = await _apiClient!.post('${ApiLinks.updatePayment}', queryParameters: {
        'job_id' : job_id,
        'amount': amount,
        'customer_id': customer_id,
        'caregiver_charge': caregiver_charge,
        'peaceworc_percentage': peaceworc_percentage,
        'peaceworc_charge': peaceworc_charge,
        'payment_status': payment_status
      });
      _response = UpdatePaymentStatusResponse.fromJson(response.data);
    } on DioError catch (e){
      _response = UpdatePaymentStatusResponse.withError(e.message);
    }
    return _response;
  }
}
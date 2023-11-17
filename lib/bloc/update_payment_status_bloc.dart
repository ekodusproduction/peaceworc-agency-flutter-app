import 'dart:ffi';

import 'package:peaceworc_agency/model/update_payment/update_payment_status.dart';
import 'package:peaceworc_agency/repositories/update_payment_status_repo.dart';
import 'package:rxdart/rxdart.dart';

class UpdatePaymentStatusBloc{
  final UpdatePaymentStatusRepository _repo = UpdatePaymentStatusRepository();
  final BehaviorSubject<UpdatePaymentStatusResponse> _behaviourSubject = BehaviorSubject<UpdatePaymentStatusResponse>();

  updatePayment(int job_id, String amount, String customer_id, String caregiver_charge, String peaceworc_percentage, String peaceworc_charge, int payment_status) async{
    UpdatePaymentStatusResponse response = await _repo.updatePayment(job_id, amount, customer_id, caregiver_charge, peaceworc_percentage, peaceworc_charge, payment_status);
    _behaviourSubject.sink.add(response);
  }
  dispose(){
    _behaviourSubject.close();
  }
  BehaviorSubject<UpdatePaymentStatusResponse> get subject => _behaviourSubject;
}
final updatePaymentStatusBloc = UpdatePaymentStatusBloc();
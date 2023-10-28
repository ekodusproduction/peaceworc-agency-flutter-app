import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaceworc_agency/bloc/job_event.dart';
import 'package:peaceworc_agency/bloc/job_state.dart';

class MyData{
  final String jobTitle;
  MyData({required this.jobTitle});
}
class DataEvent {
  final String jobTitle;
  DataEvent({required this.jobTitle});
}
class JobBloc extends Bloc<JobEvent, JobState>{
  JobBloc():super(JobInitialState()){
    on<OnChangeJobEvent>((OnChangeJobEvent event, Emitter<JobState> emit){
      emit(MyDataState(event.title));
    });
  }




}
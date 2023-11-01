abstract class JobEvent{}

class OnChangeJobTitleEvent extends JobEvent{
  final String title;
  OnChangeJobTitleEvent({required this.title});
}

class OnChangeDescEvent extends JobEvent{
  final String jobDesc;
  OnChangeDescEvent({required this.jobDesc});
}


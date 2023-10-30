abstract class JobEvent{}

class OnChangeJobEvent extends JobEvent{
  final String title;
  OnChangeJobEvent({required this.title});
}

class OnChangeDescEvent extends JobEvent{
  final String jobDesc;
  OnChangeDescEvent({required this.jobDesc});
}
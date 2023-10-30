abstract class JobTitleEvent{}
abstract class DescEvent{}

class OnChangeJobEvent extends JobTitleEvent{
  final String title;
  OnChangeJobEvent({required this.title});
}

class OnChangeDescEvent extends DescEvent{
  final String jobDesc;
  OnChangeDescEvent({required this.jobDesc});
}
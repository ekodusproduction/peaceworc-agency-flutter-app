abstract class JobEvent{}

class OnChangeJobEvent extends JobEvent{
  final String title;
  OnChangeJobEvent({required this.title});
}
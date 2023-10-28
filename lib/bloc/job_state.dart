abstract class JobState {}

class JobInitialState extends JobState{}
class MyDataState extends JobState{
  String title;

  MyDataState(this.title);
}
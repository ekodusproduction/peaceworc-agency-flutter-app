abstract class JobState {}

class JobInitialState extends JobState{}
class JobTitleStateState extends JobState{
  String title;
  JobTitleStateState(this.title);
}

class JobDescStateState extends JobState{
  String jobDesc;
  JobDescStateState(this.jobDesc);
}
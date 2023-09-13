import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/completed_job/CompletedJobCard.dart';
class CompletedJobListScreen extends StatefulWidget {
  const CompletedJobListScreen({super.key});

  @override
  State<CompletedJobListScreen> createState() => _CompletedJobListScreenState();
}

class _CompletedJobListScreenState extends State<CompletedJobListScreen> {
  final List _jobs = [
    "New Test Job, urgent requirement for female caregiver hello world how are you not good just chill.",
    "post_2",
    "post_3"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _jobs.length.toInt(),
          itemBuilder: (context, index){
            return CompletedJobCard(title: _jobs[index],);
          }),
    );
  }
}

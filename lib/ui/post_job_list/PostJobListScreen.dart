import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobCard.dart';

class PostJobListScreen extends StatefulWidget {
  const PostJobListScreen({super.key});

  @override
  State<PostJobListScreen> createState() => _PostJobListScreenState();
}

class _PostJobListScreenState extends State<PostJobListScreen> {
  final List _jobs = [
    "New Test Job, urgent requirement for female caregiver hello world how are you not good just chill.",
    "post_2",
    "post_3"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
            itemCount: _jobs.length,
            itemBuilder: (context, index){
            return PostJobCard(child: _jobs[index],);
        }),
    );
  }
}

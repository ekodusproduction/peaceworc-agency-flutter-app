import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:peaceworc_agency/ui/in_complete_job/InCompleteJobCard.dart';
class InCompleteJobListScreen extends StatefulWidget {
  const InCompleteJobListScreen({super.key});

  @override
  State<InCompleteJobListScreen> createState() => _InCompleteJobListScreenState();
}

class _InCompleteJobListScreenState extends State<InCompleteJobListScreen> {
  final List _jobs = [
    "New Test Job, urgent requirement for female caregiver hello world how are you not good just chill.",
    "post_2",
    "post_3"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _jobs.isNotEmpty ?
      ListView.builder(
          itemCount: _jobs.length.toInt(),
          itemBuilder: (context, index){
            return InCompleteJobCard(title: _jobs[index],);
          }) :
      Center(
        child: Lottie.asset(
          'assets/nodata.json',
          width: 150,
          height: 150,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

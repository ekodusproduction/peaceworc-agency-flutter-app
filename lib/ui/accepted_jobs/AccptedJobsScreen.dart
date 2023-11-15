import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/get_upcomming_job_bloc.dart';
import 'package:peaceworc_agency/ui/accepted_jobs/OngoingJobCard.dart';
import 'package:peaceworc_agency/ui/accepted_jobs/UpcommingJobCard.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobCard.dart';
class AcceptedJobsScreen extends StatefulWidget {
  const AcceptedJobsScreen({super.key});

  @override
  State<AcceptedJobsScreen> createState() => _AcceptedJobsScreenState();
}

class _AcceptedJobsScreenState extends State<AcceptedJobsScreen> {
  final List _jobs = [
    "New Test Job, urgent requirement for female caregiver hello world how are you not good just chill. bvjhEWJDJXWE HJVQWEJDEW NVJWVQD  VQJHWVXQ HJVHJQ",
    "post_2",
    "post_3"
  ];
  bool isLoading = false;

  @override
  void initState() {
    getJob();
    getJobListener();
    super.initState();
  }

  void getJob(){
    getUpommingJobBloc.getJob(0);
  }

  void getJobListener() {
    setState(() {
      isLoading = true;
    });
    getUpommingJobBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.error.toString()),
        ));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          Text("Ongoing Job", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
          SizedBox(
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _jobs.length.toInt(),
                itemBuilder: (context, index){
                  return OngoingJobCard(child: _jobs[index]);
                }),
          ),
          SizedBox(height: 8),
          Text("Upcomming Job", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
          SizedBox(
            height: 180,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _jobs.length.toInt(),
                itemBuilder: (context, index){
                  return UpcommingJobCard(title: _jobs[index]);
                }),
          ),
        ],
      ),
    );
  }
}

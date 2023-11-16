import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/get_ongoing_job_bloc.dart';
import 'package:peaceworc_agency/bloc/get_upcomming_job_bloc.dart';
import 'package:peaceworc_agency/model/get_ongoing_job/get_ongoing_job_response.dart';
import 'package:peaceworc_agency/model/get_upcomming_job/get_upcomming_job_response.dart' as uData;
import 'package:peaceworc_agency/ui/accepted_jobs/OngoingJobCard.dart';
import 'package:peaceworc_agency/ui/accepted_jobs/UpcommingJobCard.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobCard.dart';

import '../post_job_list/PostJobdetailsScreen.dart';
class AcceptedJobsScreen extends StatefulWidget {
  const AcceptedJobsScreen({super.key});

  @override
  State<AcceptedJobsScreen> createState() => _AcceptedJobsScreenState();
}

class _AcceptedJobsScreenState extends State<AcceptedJobsScreen> {
  bool isLoading = false;
  bool isOngoingLoading = false;

  @override
  void initState() {
    getJob();
    getUpcommingJobListener();
    getOngoingJobListener();
    super.initState();
  }

  void getJob(){
    getUpommingJobBloc.getJob(0);
    getOngoingJobBloc.getJob(0);
  }

  void getUpcommingJobListener() {
    setState(() {
      isLoading = true;
    });
    getUpommingJobBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));*/
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

  void getOngoingJobListener() {
    setState(() {
      isOngoingLoading = true;
    });
    getOngoingJobBloc.subject.stream.listen((value) async {
      setState(() {
        isOngoingLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));*/
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
            child: StreamBuilder<GetOngoingJobResponse>(
              stream: getOngoingJobBloc.subject.stream,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.data!.length == 0){
                    return _noDataLay();
                  }else{
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index){
                        Data _data = snapshot.data!.data![index];
                        return OngoingJobCard(data: _data, onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PostJobDetailsScreen()),
                          );
                        });
                      });
                  }
                }else{
                  return _noDataLay();
                }
              },
            ),
          ),
          SizedBox(height: 8),
          Text("Upcomming Job", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
          SizedBox(
            height: 180,
            child: StreamBuilder<uData.GetUpcommingJobResponse>(
              stream: getUpommingJobBloc.subject.stream,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.data!.length == 0){
                    return _noDataLay();
                  }else{
                    return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index){
                      uData.Data _data = snapshot.data!.data![index];
                      return UpcommingJobCard(data: _data, onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PostJobDetailsScreen()),
                        );
                      });
                    });
                  }
                }else{
                  return _noDataLay();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _noDataLay() {
    return Center(child: Text("No data found.", style: TextStyle(color: Colors.black),),);
  }

  @override
  void dispose() {
    getUpommingJobBloc.dispose();
    super.dispose();
  }
}



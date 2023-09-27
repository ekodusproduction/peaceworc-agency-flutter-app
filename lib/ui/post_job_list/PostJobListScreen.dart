import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/get_post_job_bloc.dart';
import 'package:peaceworc_agency/model/post_job/get_post_job_response.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobCard.dart';

class PostJobListScreen extends StatefulWidget {
  const PostJobListScreen({super.key});

  @override
  State<PostJobListScreen> createState() => _PostJobListScreenState();
}

class _PostJobListScreenState extends State<PostJobListScreen> {
  bool isLoading = false;

  @override
  void initState() {
    getJobListener();
    getJob();
    super.initState();
  }

  void getJob(){
    setState(() {
      isLoading = true;
    });
    getPostJobBloc.getJob('0','1');
  }
  void getJobListener() {
    getPostJobBloc.subject.stream.listen((value) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<GetPostJobResponse>(
        stream: getPostJobBloc.subject.stream,
        builder: (context, snapshot){
          if(snapshot.hasData){
            print("snapshot error => ${snapshot.error}");
            return ListView.builder(
                itemCount: snapshot.data!.data!.data!.length,
                itemBuilder: (context, index){
                  Datum _data = snapshot.data!.data!.data![index];
                  return PostJobCard(data: _data,);
                });
          }else{
            return _noDataLay();
          }
        },
      ),
    );
  }

  Widget _noDataLay() {
    return Center(child: Text("No data found.", style: TextStyle(color: Colors.black),),);
  }

  @override
  void dispose() {
    getPostJobBloc.dispose();
    super.dispose();
  }
}

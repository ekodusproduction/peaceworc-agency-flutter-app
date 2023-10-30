
import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/get_post_job_bloc.dart';
import 'package:peaceworc_agency/helper/LifeCycleWatcherState.dart';
import 'package:peaceworc_agency/model/post_job/get_post_job_response.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobCard.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobdetailsScreen.dart';
import 'package:shimmer/shimmer.dart';

class PostJobListScreen extends StatefulWidget {
  const PostJobListScreen({super.key});

  @override
  State<PostJobListScreen> createState() => _PostJobListScreenState();
}

class _PostJobListScreenState extends State<PostJobListScreen> {
  bool isLoading = false;

  @override
  void initState() {
    getJob();
    getJobListener();
    super.initState();

    WidgetsBinding.instance.addObserver(
        LifecycleEventHandler(resumeCallBack: () async => setState(() {
          print("Hello Resumed......");
          getJob();
          getJobListener();
        }),
    ));
  }

  void getJob(){
    getPostJobBloc.getJob('0','1');
  }
  void getJobListener() {
    setState(() {
      isLoading = true;
    });
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
      body:SingleChildScrollView(
        child: isLoading ? Column(
          children: [
            SizedBox(height: 8,),
            loadingCard(),
            loadingCard(),
            loadingCard(),
          ],
        ) : Column(
          children: [
            StreamBuilder<GetPostJobResponse>(
              stream: getPostJobBloc.subject.stream,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  print("snapshot error => ${snapshot.error}");
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.data!.length,
                      itemBuilder: (context, index){
                        Datum _data = snapshot.data!.data!.data![index];
                        return PostJobCard(data: _data, onTap: () async{
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PostJobDetailsScreen()),
                          );

                          if (!mounted) return;
                          getJob();
                          getJobListener();
                        },);
                      });
                }else{
                  return _noDataLay();
                }
              },
            ),
          ],
        )
      )
    );
  }

  Shimmer loadingCard(){
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
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

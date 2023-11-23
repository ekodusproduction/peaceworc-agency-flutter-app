import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/get_completed_jobs_bloc.dart';
import 'package:peaceworc_agency/model/get_completed_job/get_completed_jobs_response.dart';
import 'package:peaceworc_agency/ui/completed_job/CompletedJobCard.dart';
import 'package:peaceworc_agency/ui/completed_job/CompletedJobDetailsScreen.dart';
import 'package:shimmer/shimmer.dart';
class CompletedJobListScreen extends StatefulWidget {
  const CompletedJobListScreen({super.key});
  @override
  State<CompletedJobListScreen> createState() => _CompletedJobListScreenState();
}

class _CompletedJobListScreenState extends State<CompletedJobListScreen> {
  bool isLoading = false;
  bool isJobEmpty = false;

  @override
  void initState() {
    getJob();
    getJobListener();
    super.initState();
  }

  void getJob(){
    getCompletedJobsBloc.getCompletedJobs(0,1);
  }
  void getJobListener() {
    setState(() {
      isLoading = true;
    });
    getCompletedJobsBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          if(value.data!.length == 0){
            setState(() {
              isJobEmpty = true;
            });
          }
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
      body: isJobEmpty ? _noDataLay() :SingleChildScrollView(
        child: isLoading ? Column(
          children: [
            SizedBox(height: 8,),
            loadingCard(),
            loadingCard(),
            loadingCard(),
          ],
        ) : StreamBuilder<GetCompletedJobsResponse>(
          stream: getCompletedJobsBloc.subject.stream,
          builder: (context, snapshot){
            if(snapshot.hasData){
              if(snapshot.data!.data!.length <= 0){
                return _noDataLay();
              }else{
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index){
                      Data _data = snapshot.data!.data![index];
                      return CompletedJobCard(data: _data, onTap: () async{
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CompletedJobDetailsScreen()),
                        );
                        if (!mounted) return;
                        getJob();
                        getJobListener();
                      },);
                    });
              }
            }else{
              return _noDataLay();
            }
          },
        ),

      )
    );
  }

  Widget _noDataLay() {
    return Center(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("No Data Found", style: TextStyle(color: Colors.black, fontSize: 18.0))
    ));
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

  @override
  void dispose() {
    getCompletedJobsBloc.dispose();
    super.dispose();
  }
}

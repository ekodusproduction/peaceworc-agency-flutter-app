import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:peaceworc_agency/bloc/get_incomplete_job_bloc.dart';
import 'package:peaceworc_agency/model/get_incomplete_job/get_incomplete_job_response.dart';
import 'package:peaceworc_agency/ui/in_complete_job/InCompleteJobCard.dart';
import 'package:peaceworc_agency/ui/in_complete_job/InCompleteJobDetailsScreen.dart';
import 'package:shimmer/shimmer.dart';
class InCompleteJobListScreen extends StatefulWidget {
  const InCompleteJobListScreen({super.key});

  @override
  State<InCompleteJobListScreen> createState() => _InCompleteJobListScreenState();
}

class _InCompleteJobListScreenState extends State<InCompleteJobListScreen> {
  bool isLoading = false;
  bool isJobEmpty = false;

  @override
  void initState() {
    getJob();
    getJobListener();
    super.initState();
  }

  void getJob(){
    getInCompleteJobBloc.getInCompletedJobs();
  }
  void getJobListener() {
    setState(() {
      isLoading = true;
    });
    getInCompleteJobBloc.subject.stream.listen((value) async {
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
        ) : StreamBuilder<GetInCompletedJobsResponse>(
          stream: getInCompleteJobBloc.subject.stream,
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
                      return InCompleteJobCard(data: _data, onTap: () async{
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const InCompleteJobDetailsScreen()),
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
    getInCompleteJobBloc.dispose();
    super.dispose();
  }
}

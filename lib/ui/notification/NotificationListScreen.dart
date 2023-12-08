import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobCard.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {

  final List _jobs = [
    "New Test Job, urgent requirement for female caregiver hello world how are you not good just chill.",
    "post_2",
    "post_3",
    "post_3"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView.builder(
              itemCount: _jobs.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.notifications, color: Colors.black,size: 18,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Job Completed", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),),
                                SizedBox(height: 5,),
                                Text(
                                  "Job number 2034 has been completed by Jhon Walter on 24th, sept 12:PM",
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 11
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
    );
  }
}

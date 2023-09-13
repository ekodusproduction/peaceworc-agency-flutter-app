import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/accepted_jobs/AccptedJobsScreen.dart';
import 'package:peaceworc_agency/ui/completed_job/CompletedJobDetailsScreen.dart';
import 'package:peaceworc_agency/ui/completed_job/CompletedJobListScreen.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobListScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Image.asset("assets/images/new_logo.png")
                        ),
                        Text(
                          'Peaceworc Agency',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.chat, color: Colors.black, size: 30.0,)
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(7.0)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0),
                        child: Icon(Icons.search_outlined, color: Colors.grey[600],),
                      ),
                      SizedBox(width: 10.0,),
                      Text("Search post job")
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.show_chart, size: 12, color: Colors.white,),
                                      Text("6", style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                  Text("Job posted", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.0),),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                          )
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                              child: Column(
                                children: [
                                Text("276", style: TextStyle(color: Colors.white),),
                                  Text("Investments", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.0),),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                          )
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star_border_outlined, size: 12, color: Colors.white,),
                                      Text("2", style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                  Text("Hello world", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.0),),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                          )
                      ),
                    ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TabBar(
                    padding: EdgeInsets.all(5.0),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[700],
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Post",),
                      Tab(text: "Accepted",),
                      Tab(text: "Completed",),
                      Tab(text: "InComplete",),
                    ],
                  ),
                ),
                const Expanded(
                    child:  TabBarView(
                      children: [
                        PostJobListScreen(),
                        AcceptedJobsScreen(),
                        CompletedJobListScreen(),
                        Icon(Icons.child_friendly_sharp, size: 350),
                      ],
                    ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

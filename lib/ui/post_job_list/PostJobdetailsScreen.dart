import 'package:flutter/material.dart';
class PostJobDetailsScreen extends StatefulWidget {
  const PostJobDetailsScreen({super.key});

  @override
  State<PostJobDetailsScreen> createState() => _PostJobDetailsScreenState();
}

class _PostJobDetailsScreenState extends State<PostJobDetailsScreen> {
  final List _checkList = [
    "New Test Job, urgent requirement.",
    "post_2 prepare meal.",
    "post_3 buy medicines.",
    "post_3 No smoking."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Job Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete_outline, color: Colors.black,),
          ),
        ],
      ),

      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: IntrinsicHeight(
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0,),
                              Text("Status", style: TextStyle(color: Colors.white, fontSize: 13),),
                              Text("Open Job", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                              SizedBox(height: 4.0,),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0,),
                              Text("Time left", style: TextStyle(color: Colors.white, fontSize: 13),),
                              Text("00:00:00", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                              SizedBox(height: 4.0,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text("Urget need for female caregiver for old test test test patient.", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.person_outline, color: Colors.black, size: 18,),
                      SizedBox(width: 5.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Child Care", style: TextStyle(fontSize: 13, color: Colors.black)),
                          Text("Tulip, Female: 56", style: TextStyle(fontSize: 13, color: Colors.black))
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Remittance", style: TextStyle(fontSize: 13, color: Colors.black)),
                      Text("\u002426", style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
              child: Row(
                children: [
                  Icon(Icons.date_range_outlined, color: Colors.black, size: 18,),
                  SizedBox(width: 5.0,),
                  Text("09-13-2023 to 09-14-2023", style: TextStyle(fontSize: 13, color: Colors.black),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
              child: Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: Colors.black, size: 18,),
                  SizedBox(width: 5.0,),
                  Text("10:30 PM to 11:30 PM", style: TextStyle(fontSize: 13, color: Colors.black),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.black, size: 18,),
                  SizedBox(width: 5.0,),
                  Expanded(child: Text("Hostone street, 5679 new town, sanfrancisco, California, usa", style: TextStyle(fontSize: 13, color: Colors.black),))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.grey[300], height: 2,),
            SizedBox(height: 20,),

            Padding(
              padding: EdgeInsets.only(right: 50.0, left:50.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TabBar(
                  padding: EdgeInsets.all(3.0),
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: "Job overview",),
                    Tab(text: "checklist",),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child:  TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:20.0,left:10.0, right:10.0),
                    child: Container(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job Description & Responsibilities", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", style: TextStyle(color: Colors.black, fontSize: 13),),
                        ],
                      ),
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:20.0,left:10.0, right:10.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
                            child: Text("Caregiver checklist personal care duties and tasks", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                              itemCount: _checkList.length.toInt(),
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.circle_sharp, color: Colors.black, size: 10,),
                                      SizedBox(width: 5,),
                                      Text(_checkList[index])
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
class CompletedJobDetailsScreen extends StatefulWidget {
  const CompletedJobDetailsScreen({super.key});

  @override
  State<CompletedJobDetailsScreen> createState() => _CompletedJobDetailsScreenState();
}

class _CompletedJobDetailsScreenState extends State<CompletedJobDetailsScreen> {
  final List _checkList = [
    "New Test Job, urgent requirement.",
    "post_2 prepare meal.",
    "post_3 buy medicines.",
    "post_3 No smoking."
  ];
  final String imageUrl = "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80";
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Job Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
      ),
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: (){},
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(50), // Image radius
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0))
                ),
              )
          ), //button first

          Container(
              margin:EdgeInsets.only(bottom: 50, left: 10.0, right: 10, top: 10),
              child: FloatingActionButton(
                onPressed: (){},
                backgroundColor: Colors.black,
                child: Icon(Icons.chat, color: Colors.white,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0))
                ),
              )
          ), // button second
        ],
      ),

      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.green[500],
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
                                Text("Status", style: TextStyle(color: Colors.white, fontSize: 12),),
                                Text("Completed Job", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
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
                                Text("Time left", style: TextStyle(color: Colors.white, fontSize: 12),),
                                Text("00:00:00", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                SizedBox(height: 4.0,),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
                            child: Text("Job Activities", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(width: 8.0,)
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
                      SingleChildScrollView(
                        child: Padding(
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
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SwipeableButtonView(
                  buttonText: 'Slide to close the job',
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Color(0xFF009C41),
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () {

                    //TODO: For reverse ripple effect animation
                    setState(() {
                      isFinished = false;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

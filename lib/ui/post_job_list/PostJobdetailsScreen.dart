import 'package:flutter/material.dart';
class PostJobDetailsScreen extends StatefulWidget {
  const PostJobDetailsScreen({super.key});

  @override
  State<PostJobDetailsScreen> createState() => _PostJobDetailsScreenState();
}

class _PostJobDetailsScreenState extends State<PostJobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Job Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline, color: Colors.black,),
          ),
        ],
      ),

      body: Column(
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
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text("Urget need for female caregiver for old patient.", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
          )
        ],
      ),
    );
  }
}

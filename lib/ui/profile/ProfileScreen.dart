import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String imageUrl = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 30,),
                      Text("Company Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      Icon(Icons.edit, color: Colors.white,),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(1), // Border width
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(50), // Image radius
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Ekodustech",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("ekodustech@gmail.com",style: TextStyle(color: Colors.white, fontSize: 13),),
                  SizedBox(height: 20,),
                  Divider(
                    height: 0.5,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5,),
                  Column(
                      children:[
                        IntrinsicHeight(
                            child:Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Years in business", style: TextStyle(color: Colors.white, fontSize: 13),),
                                      Text("0", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),)
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Employee", style: TextStyle(color: Colors.white, fontSize: 13),),
                                      Text("No Data", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),)
                                    ],
                                  ),
                                ),

                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Country", style: TextStyle(color: Colors.white, fontSize: 13),),
                                      Text("No Data", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),)
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ]
                  ),
                  SizedBox(height: 5,)
                ],
              ),
            ),
            Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tax ID/Number", style: TextStyle(color: Colors.black, fontSize: 13),),
                                  Text("809978228", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                                  SizedBox(height: 20,),
                                  Text("Annual business revnue", style: TextStyle(color: Colors.black, fontSize: 13),),
                                  Text("No Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Legal Structure", style: TextStyle(color: Colors.black, fontSize: 13),),
                                Text("No Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                                SizedBox(height: 20,),
                                Text("Organization Type", style: TextStyle(color: Colors.black, fontSize: 13),),
                                Text("No Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

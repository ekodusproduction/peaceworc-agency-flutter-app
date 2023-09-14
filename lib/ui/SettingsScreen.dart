import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/authorized_officer/authorize_officer_list_screen.dart';
import 'package:peaceworc_agency/ui/change_pass/change_password_screen.dart';
import 'package:peaceworc_agency/ui/client_management/client_list_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
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
                            Text("Full Name", style: TextStyle(color: Colors.white, fontSize: 13),),
                            Text("Subhrajit Dev", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
                            SizedBox(height: 20,),
                            Text("Email Address", style: TextStyle(color: Colors.white, fontSize: 13),),
                            Text("subhrajitdeb54@gmail.com", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Role", style: TextStyle(color: Colors.white, fontSize: 13),),
                          Text("Agency Owner", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
                          SizedBox(height: 20,),
                          Text("Mobile Number", style: TextStyle(color: Colors.white, fontSize: 13),),
                          Text("8011299876", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lock_outline, color: Colors.black, size: 20,),
                            SizedBox(width: 10,),
                            Text("Change Password", style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorizeOfficerListScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_outline, color: Colors.black, size: 20,),
                            SizedBox(width: 10,),
                            Text("Authorizes Officer", style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClientManagementListScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined, color: Colors.black, size: 20,),
                            SizedBox(width: 10,),
                            Text("Client Management", style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  _showMyDialog();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout_outlined, color: Colors.black, size: 20,),
                            SizedBox(width: 10,),
                            Text("Logout", style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout !'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to exit the app?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          //icon: Icon(Icons.logout_outlined, color: Colors.black, size: 24,),
        );
      },
    );
  }
}

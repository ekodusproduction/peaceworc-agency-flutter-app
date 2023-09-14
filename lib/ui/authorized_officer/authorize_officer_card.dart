import 'package:flutter/material.dart';
class AuthorizeOfficerCard extends StatelessWidget {
  final String title;
  const AuthorizeOfficerCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full name", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),),
                        Text("testmark jugdwyedj", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  InkWell(
                      onTap: (){},
                      child: Icon(Icons.delete_outline, color: Colors.black, size: 24)
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email address", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),),
                  Text("testmark@gmail.com", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10.0,),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile number", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),),
                        Text("9010298374", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Role", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),),
                      Text("Admin", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

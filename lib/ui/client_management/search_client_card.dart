import 'package:flutter/material.dart';

class SearchClientCard extends StatelessWidget {
  final String title;
  final String imageUrl = "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80";
  const SearchClientCard({required this.title});

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
          child: Flex(
            direction: Axis.horizontal,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(25), // Image radius
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                )
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full name", style: TextStyle(color: Colors.grey[800]),),
                        Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email address", style: TextStyle(color: Colors.grey[800]),),
                        Text("testmark@gmail.com", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile number", style: TextStyle(color: Colors.grey[800]),),
                        Text("9010298374", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                      onTap: (){},
                      child: Icon(Icons.add_circle_outline_outlined, color: Colors.black, size: 24)
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

import 'package:flutter/material.dart';
import 'package:peaceworc_agency/api/api_links.dart';
import 'package:peaceworc_agency/model/search_client/search_client_response.dart';

class SearchClientCard extends StatelessWidget {
  final Data data;
  final Function()? onTap;
  const SearchClientCard({required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                    child: Image.network('${ApiLinks.PUBLIC_URL}${data.photo}', fit: BoxFit.cover),
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
                          Text(data.name.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email address", style: TextStyle(color: Colors.grey[800]),),
                          Text("${data.email}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mobile number", style: TextStyle(color: Colors.grey[800]),),
                          Text("${data.phone}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.add_circle_outline_outlined, color: Colors.black, size: 24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

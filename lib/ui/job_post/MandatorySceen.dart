import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/location/search_location_screen.dart';
class MandatoryScreen extends StatefulWidget {
  const MandatoryScreen({super.key});

  @override
  State<MandatoryScreen> createState() => _MandatoryScreenState();
}

class _MandatoryScreenState extends State<MandatoryScreen> {
  TextEditingController jobTitle = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Align(alignment: Alignment.centerLeft,child: const Text("Job Information", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),)),
        SizedBox(height: 8.0,),
        TextField(
          controller: jobTitle,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Job Title',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Job description & responsibilities',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5)
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add_circle_outline_outlined, color: Colors.white,),
                      SizedBox(width: 10.0,),
                      Text('Select Care Type', style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white,)
                ],
              ),
            )
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add_circle_outline_outlined, color: Colors.black,),
                      SizedBox(width: 10.0,),
                      Text('Add Time & Date', style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black,)
                ],
              ),
            )
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.monetization_on_outlined, color: Colors.black,),
                  SizedBox(width: 10.0,),
                  Text('Remittance', style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                ],
              ),
            )
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchLocationScreen()));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search, color: Colors.grey,),
                    SizedBox(width: 10.0,),
                    Text('Search Address', style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.bold),),
                  ],
                ),
              )
          ),
        ),
        SizedBox(height: 8,),
        Visibility(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("San Francisco", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                  Text("german streen 5679, #234-900, North Point Streen, San Francisco ,usa", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey[600],
                  ),
                  Text("Street name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  Text("900, North Point Streen", style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  Text("Apartment name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  Text("123 building, 19 floor", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  SizedBox(height: 4,),
                ],
              ),
            ),
          ),
          visible: false,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

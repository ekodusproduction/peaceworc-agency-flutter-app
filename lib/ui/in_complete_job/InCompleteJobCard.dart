import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/in_complete_job/InCompleteJobDetailsScreen.dart';
class InCompleteJobCard extends StatelessWidget {
  final String title;
  const InCompleteJobCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => InCompleteJobDetailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: Text(
                        title,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Container(
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100))
                          ),
                          child: SizedBox(width:10, child: Padding(
                            padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 1.0, bottom: 1.0),
                            child: Text(
                              "InCompleted Job",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ))
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person_outline, size: 15,),
                          SizedBox(width: 5,),
                          Text("Child Care", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,),
                          Icon(Icons.do_not_disturb_on_total_silence, color: Colors.grey[800],size: 4,),
                          Text("Tulip, Female: 56 Yrs", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,)
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined, size: 15,),
                          SizedBox(width: 5,),
                          Text("3087 Terminal Dr.Care, Herbor, Ky 4102563, usa", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.calendar_month_outlined, size: 15,),
                          SizedBox(width: 5,),
                          Text("2023-09-01", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1,),
                          SizedBox(width: 15,),
                          Text("7:28PM - 9:40PM", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("\u002423", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[500]),)),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
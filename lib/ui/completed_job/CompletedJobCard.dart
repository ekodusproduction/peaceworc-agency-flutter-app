import 'package:flutter/material.dart';
import 'package:peaceworc_agency/model/get_completed_job/get_completed_jobs_response.dart';
import 'package:peaceworc_agency/ui/completed_job/CompletedJobDetailsScreen.dart';
class CompletedJobCard extends StatelessWidget {
  final Data data;
  final Function()? onTap;
  const CompletedJobCard({required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                        data.title!,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Container(
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100))
                          ),
                          child: SizedBox(width:10, child: Padding(
                            padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 1.0, bottom: 1.0),
                            child: Text(
                              data.status!,
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
                          Text(data.careType!, style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,),
                          Icon(Icons.do_not_disturb_on_total_silence, color: Colors.grey[800],size: 4,),
                          Text("${data.careItems![0].patientName}, ${data.careItems![0].gender}: ${data.careItems![0].age} Yrs", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,)
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined, size: 15,),
                          SizedBox(width: 5,),
                          Text("${data.shortAddress}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.calendar_month_outlined, size: 15,),
                          SizedBox(width: 5,),
                          Text("${data.startDate} to ${data.endDate}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1,),
                          SizedBox(width: 15,),
                          Text("${data.startTime} - ${data.endTime}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                          child: Text("\u0024${data.amount}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[500]),)),
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


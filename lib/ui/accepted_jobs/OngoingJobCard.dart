import 'package:flutter/material.dart';
import 'package:peaceworc_agency/model/get_ongoing_job/get_ongoing_job_response.dart';
import 'package:peaceworc_agency/ui/post_job_list/PostJobdetailsScreen.dart';
class OngoingJobCard extends StatelessWidget {
  final Data data;
  final Function()? onTap;
  const OngoingJobCard({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            color: Colors.white,
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
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100))
                            ),
                            child: SizedBox(width:10, child: Padding(
                              padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 1.0, bottom: 1.0),
                              child: Text(
                                ' Ongoing ',
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
                            Text("${data.careItems![0].patientName}, Female: ${data.careItems![0].age} Yrs", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),maxLines: 1,)
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("\u0024${data.amount}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[500]),),
                                SizedBox(width: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.green[500]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 7.0, right: 7.0, top: 5.0, bottom: 5.0),
                                    child: Text("TIME LEFT : 02:24", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10), maxLines: 1,),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.black,),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


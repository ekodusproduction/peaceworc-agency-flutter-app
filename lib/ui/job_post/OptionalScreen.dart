import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peaceworc_agency/ui/job_post/MandatorySceen.dart';
class OptionalScreen extends StatefulWidget {
  const OptionalScreen({super.key});

  @override
  State<OptionalScreen> createState() => OptionalScreenState();
}

class OptionalScreenState extends State<OptionalScreen> {
  TextEditingController medicalHistory = TextEditingController();
  TextEditingController jobExperties = TextEditingController();
  TextEditingController otherRequirements = TextEditingController();
  TextEditingController checkList = TextEditingController();

  static List<String> medicalList = <String>[];
  static List<String> jobExpertiesList = <String>[];
  static List<String> otherRequirementsList = <String>[];
  static List<String> checkListList = <String>[];

  static void clearOptVariable(){
    medicalList = <String>[];
    jobExpertiesList = <String>[];
    otherRequirementsList = <String>[];
    checkListList = <String>[];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Medical history(if any)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: medicalList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(medicalList[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        medicalList.removeAt(index);
                                      });
                                    },
                                    child: Text("Remove",)
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 5,),
                TextField(
                  controller: medicalHistory,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "ADD",
                      contentPadding:
                      EdgeInsets.only(left: 10.0,right: 40.0, top: 10.0, bottom: 10.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.add_circle_outline_outlined),
                          onPressed:(){
                            setState(() {
                              if(medicalHistory.text.isNotEmpty){
                                medicalList.add(medicalHistory.text);
                                medicalHistory.clear();
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please enter something.'),
                                    )
                                );
                              }
                            });
                          }
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0,),
        Container(
          decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Job experties skill(s) required", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: jobExpertiesList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(jobExpertiesList[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        jobExpertiesList.removeAt(index);
                                      });
                                    },
                                    child: Text("Remove",)
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 5,),
                TextField(
                  controller: jobExperties,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "ADD",
                      contentPadding:
                      EdgeInsets.only(left: 10.0,right: 40.0, top: 10.0, bottom: 10.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.add_circle_outline_outlined),
                          onPressed:(){
                            setState(() {
                              if(jobExperties.text.isNotEmpty){
                                jobExpertiesList.add(jobExperties.text);
                                jobExperties.clear();
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please enter something.'),
                                    )
                                );
                              }
                            });
                          }
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0,),
        Container(
          decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Other requirements", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: otherRequirementsList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(otherRequirementsList[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        otherRequirementsList.removeAt(index);
                                      });
                                    },
                                    child: Text("Remove",)
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 5,),
                TextField(
                  controller: otherRequirements,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "ADD",
                      contentPadding:
                      EdgeInsets.only(left: 10.0,right: 40.0, top: 10.0, bottom: 10.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.add_circle_outline_outlined),
                          onPressed:(){
                            setState(() {
                              if(otherRequirements.text.isNotEmpty){
                                otherRequirementsList.add(otherRequirements.text);
                                otherRequirements.clear();
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please enter something.'),
                                    )
                                );
                              }
                            });
                          }
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0,),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Caregiver checklist", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: checkListList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(checkListList[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        checkListList.removeAt(index);
                                      });
                                    },
                                    child: Text("Remove",)
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 5,),
                TextField(
                  controller: checkList,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "ADD",
                      contentPadding:
                      EdgeInsets.only(left: 10.0,right: 40.0, top: 10.0, bottom: 10.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.add_circle_outline_outlined),
                          onPressed:(){
                            setState(() {
                              if(checkList.text.isNotEmpty){
                                checkListList.add(checkList.text);
                                checkList.clear();
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please enter something.'),
                                    )
                                );
                              }
                            });
                          }
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peaceworc_agency/ui/job_post/MandatorySceen.dart';
class OptionalScreen extends StatefulWidget {
  const OptionalScreen({super.key});

  @override
  State<OptionalScreen> createState() => _OptionalScreenState();
}

class _OptionalScreenState extends State<OptionalScreen> {
  TextEditingController medicalHistory = TextEditingController();
  TextEditingController jobExperties = TextEditingController();
  TextEditingController otherRequirements = TextEditingController();
  TextEditingController checkList = TextEditingController();

  final List<String> _medicalList = <String>[];
  final List<String> _jobExperties = <String>[];
  final List<String> _otherRequirements = <String>[];
  final List<String> _checkList = <String>[];

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
                    shrinkWrap: true,
                    itemCount: _medicalList.length,
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
                                Text(_medicalList[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        _medicalList.removeAt(index);
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
                                _medicalList.add(medicalHistory.text);
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
                    shrinkWrap: true,
                    itemCount: _jobExperties.length,
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
                                Text(_jobExperties[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        _jobExperties.removeAt(index);
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
                                _jobExperties.add(jobExperties.text);
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
                    shrinkWrap: true,
                    itemCount: _otherRequirements.length,
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
                                Text(_otherRequirements[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        _otherRequirements.removeAt(index);
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
                                _otherRequirements.add(otherRequirements.text);
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
                    shrinkWrap: true,
                    itemCount: _checkList.length,
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
                                Text(_checkList[index]),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        _checkList.removeAt(index);
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
                                _checkList.add(checkList.text);
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

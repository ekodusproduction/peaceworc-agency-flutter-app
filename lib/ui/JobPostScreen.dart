import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  TextEditingController jobTitle = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController medicalHistory = TextEditingController();

  int _activeStepIndex = 0;
  bool isLast = false;

  final List<String> _medicalList = <String>[];

  List<Step> stepList() => [
     Step(
        state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 0,
        title: const Text(""),
        label: Text("Mandatory", style: TextStyle(fontSize: 12),),
        content: Flex(
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
            Container(
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
            const SizedBox(
              height: 20,
            ),
          ],
        )
    ),
    Step(
        state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text(""),
        label: Text("Optional", style: TextStyle(fontSize: 12)),
        content: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medical history(if any)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    _medicalList.isEmpty ? SizedBox() : Container(
                      child: ListView.builder(
                          itemCount: _medicalList.length,
                          itemBuilder: (context, index){
                            return Container(
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
                            );
                          }),
                    ),
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

                              print(_medicalList);
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
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Job experties skill(s) required", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: email,
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
                                print("clicked");
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
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Other requirements", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: email,
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
                                print("clicked");
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
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Caregiver checklist", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: email,
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
                                print("clicked");
                              }
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    ),
    Step(
        state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text(""),
        label: Text("Preview", style: TextStyle(fontSize: 12)),
        content: const Center(child: Text('Confirm'),)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Job", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
      ),
      body: Stepper(
        elevation: 0,
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: (){
          print(_activeStepIndex);

          if(_activeStepIndex < (stepList().length-1)){
              setState(() {
                _activeStepIndex += 1;
                isLast = _activeStepIndex == 2;
              });
          }
        },
        onStepCancel: (){
            if(_activeStepIndex == 0){
              return;
            }
            setState(() {
              _activeStepIndex -= 1;
            });
        },
        /*onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },*/
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          if(isLast == false){
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: details.onStepContinue,
                  child: const Text('Next Step >', style: TextStyle(color: Colors.white),),
                ),
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: details.onStepContinue,
                  child: const Text('Save', style: TextStyle(color: Colors.white),),
                ),
              ),
            );
          }
        },
      )
    );
  }
}

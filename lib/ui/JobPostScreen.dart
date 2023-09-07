import 'dart:ffi';

import 'package:flutter/material.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  TextEditingController jobTitle = TextEditingController();
  TextEditingController email = TextEditingController();

  int _activeStepIndex = 0;
  bool isLast = false;

  List<Step> stepList() => [
     Step(
        state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 0,
        title: const Text(""),
        label: Text("Mandatory", style: TextStyle(fontSize: 12),),
        content: Flex(
          direction: Axis.vertical,
          children: [
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
                         Text('Select Care Type', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),),
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
                          Text('Add Time & Date', style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
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
            )
          ],
        )
    ),
    Step(
        state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text(""),
        label: Text("Optional", style: TextStyle(fontSize: 12)),
        content: const Center(child: Text('Address'),)
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

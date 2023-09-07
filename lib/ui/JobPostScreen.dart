import 'package:flutter/material.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  int _activeStepIndex = 0;
  List<Step> stepList() => [
     Step(
        state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 0,
        title: const Text("Account"),
        content: const Center(child: Text('Account'),)
    ),
    Step(
        state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text("Address"),
        content: const Center(child: Text('Address'),)
    ),
    Step(
        state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text("Confirm"),
        content: const Center(child: Text('Confirm'),)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: (){
            if(_activeStepIndex < (stepList().length-1)){
              setState(() {
                _activeStepIndex += 1;
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
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextButton(
                onPressed: details.onStepContinue,
                child: const Text('NEXT', style: TextStyle(color: Colors.white),),
              ),
            ),
          );
        },
      )
    );
  }
}

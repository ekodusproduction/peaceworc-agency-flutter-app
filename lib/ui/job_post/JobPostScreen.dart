import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peaceworc_agency/bloc/job_bloc.dart';
import 'package:peaceworc_agency/bloc/job_event.dart';
import 'package:peaceworc_agency/bloc/job_state.dart';
import 'package:peaceworc_agency/ui/job_post/MandatorySceen.dart';
import 'package:peaceworc_agency/ui/job_post/OptionalScreen.dart';
import 'package:peaceworc_agency/ui/job_post/job_preview_screen.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> with jobMendatoryValidationMixin {
  final mandatoryScreen = MandatoryScreen();
  int _activeStepIndex = 0;
  bool isLast = false;
  bool isValid = false;

  void continueStep(){
    if(_activeStepIndex < (stepList().length-1)){
      setState(() {
        _activeStepIndex += 1;
        isLast = _activeStepIndex == 2;
      });
    }
  }

  List<Step> stepList() => [
     Step(
        state: _activeStepIndex <= 0 ? StepState.indexed : StepState.complete,
        isActive: _activeStepIndex >= 0,
        title: const Text(""),
        label: Text("Mandatory", style: TextStyle(fontSize: 12),),
        content: MandatoryScreen()
    ),
    Step(
        state: _activeStepIndex <= 1 ? StepState.indexed : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text(""),
        label: Text("Optional", style: TextStyle(fontSize: 12)),
        content: OptionalScreen()
    ),
    Step(
        state: _activeStepIndex <= 2 ? StepState.indexed : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text(""),
        label: Text("Preview", style: TextStyle(fontSize: 12)),
        content: SingleChildScrollView(
          child: JobPreviewScreen()
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final jobBloc = context.read<JobBloc>();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Post Job", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
      ),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (context, state){

          return Stepper(
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
                      onPressed: (){
                        if(MandatoryScreenState.checkValidation().isEmpty){
                          continueStep();
                        }else{
                          Fluttertoast.showToast(
                              msg: MandatoryScreenState.checkValidation(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
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
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                );
              }
            },
          );
        },
      )
    );
  }

  @override
  void dispose() {
    MandatoryScreenState.clearVariable();
    super.dispose();
  }
}

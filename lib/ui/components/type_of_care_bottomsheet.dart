import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/job_post/MandatorySceen.dart';
import 'package:peaceworc_agency/ui/job_post/data_classes.dart';
class TypeOfCareBottomSheet extends StatefulWidget {
  const TypeOfCareBottomSheet({super.key});

  @override
  State<TypeOfCareBottomSheet> createState() => _TypeOfCareBottomSheetState();
}

class _TypeOfCareBottomSheetState extends State<TypeOfCareBottomSheet> {
  bool isSelectedSenior = false;
  bool isSelectedChild = false;
  bool isSelectedPatient = false;
  late String careType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 30,),
                Text("Type of care", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                    child: Icon(Icons.clear, color: Colors.black, size: 30,)
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        isSelectedSenior = true;
                        isSelectedChild = false;
                        isSelectedPatient = false;
                        careType = "Senior Care";
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelectedSenior ? Colors.black : Colors.grey.shade300
                      ),                  child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: isSelectedSenior ? Image.asset("assets/images/old_care_white.png") :Image.asset("assets/images/old_care.png"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isSelectedSenior = false;
                        isSelectedChild = true;
                        isSelectedPatient = false;
                        careType = "Child Care";
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSelectedChild ? Colors.black : Colors.grey.shade300
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: isSelectedChild ? Image.asset("assets/images/child_care_white.png") :Image.asset("assets/images/child_care.png"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isSelectedSenior = false;
                        isSelectedChild = false;
                        isSelectedPatient = true;
                        careType = "Child Care";
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelectedPatient ? Colors.black : Colors.grey.shade300
                      ),                  child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: isSelectedPatient ?Image.asset("assets/images/patient_care_white.png") :Image.asset("assets/images/patient_care.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      final data = CareTypeData(
                        careType: careType,
                        isClientVisible: true
                      );
                      Navigator.pop(context, data);
                    });
                  },
                  child: const Text('Save', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

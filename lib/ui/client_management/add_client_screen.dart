import 'package:flutter/material.dart';
class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> with InputValidationMixin {
  var fullNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();

  String dropdownValue = 'Select gender';
  List <String> spinnerItems = [
    'Select gender',
    'Male',
    'Female',
    'Other',
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Client Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: fullNameController,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Full name',
                  labelStyle: TextStyle(color: Colors.black)
              ),
              validator: (String? value) {
                if(isNameValid(value!).length != 0){
                  return isNameValid(value!);
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: mobileController,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Mobile number',
                  labelStyle: TextStyle(color: Colors.black)
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              validator: (String? value) {
                if(isNumberValid(value!).length != 0){
                  return isNumberValid(value!);
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            TextFormField(
              controller: emailController,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.black)
              ),
              validator: (String? value) {
                if(!isEmailValidate(value!)){
                  return 'Invalid email address';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.grey.shade400,
              ),
              onChanged: (String? data) {
                setState(() {
                  dropdownValue = data!;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      )
    );
  }
}
mixin InputValidationMixin{
  String isNameValid(String password){
    if(password.isEmpty){
      return "Full name is required";
    }
    return "";
  }
  String isNumberValid(String number){
    if(number.length < 10){
      return "Mobile number must be a 10 digit number";
    }
    if(double.parse(number) == 0.00){
      return "Invalid mobile number";
    }
    return "";
  }
  bool isEmailValidate(String value){
    if(!RegExp(r"^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$")
        .hasMatch(value!)){
      return false;
    }
    return true;
  }
  String isAgeValid(String age){
    if(double.parse(age) == 0.00){
      return "Invalid age";
    }
    return "";
  }
}
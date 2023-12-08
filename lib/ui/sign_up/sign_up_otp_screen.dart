import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:peaceworc_agency/bloc/sign_up_verify_otp_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_dash/HomePage.dart';
class SignUpOtpScreen extends StatefulWidget {
  final String? email;
  final String? company_name;
  final String? full_name;
  const SignUpOtpScreen({super.key, this.email, this.company_name, this.full_name});

  @override
  State<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  var time = 0;
  String? otp;
  bool isLoading = false;

  @override
  void initState() {
    verifyOtpListener();
    super.initState();
  }
  void verifyOtpListener() {
    signUpVerifyOtpBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          final prefs = await SharedPreferences.getInstance();
          setState((){
            prefs.setBool('isLoggedIn', true);
            prefs.setString("auth_token", value.token.toString());
            prefs.setString("full_name", widget.full_name!);
            prefs.setString("user_id", value.data.toString());
          });
          Navigator.of(context).pop();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.error.toString()),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,)
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/new_logo.png")
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter 6 digits OTP sent to ${widget.email}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
                SizedBox(height: 40.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: OTPTextField(
                      controller: otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      otpFieldStyle: OtpFieldStyle(enabledBorderColor: Colors.white),
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      onChanged: (pin) {
                        setState(() {
                          otp = pin;
                        });
                      },
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      }),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("OTP will be expired in: ${time} sec", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                    Text("Resend", style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text(
                          "Verify OTP",
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 40, right: 40, top: 13, bottom: 13)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.white)
                              )
                          )
                      ),
                      onPressed: () =>
                      {
                        if(otp!= null){
                          if(otp!.length != 6){
                            signUpVerifyOtpBloc.verifyOtp(widget.email!, otp!, widget.company_name!)
                          }else{
                            Fluttertoast.showToast(
                              msg: "OTP must be a 6 digit number",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                            )
                          }
                        }else{
                          Fluttertoast.showToast(
                              msg: "Invalid OTP",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          )
                        }
                      }
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    signUpVerifyOtpBloc.dispose();
    super.dispose();
  }
}

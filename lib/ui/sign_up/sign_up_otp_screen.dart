import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
class SignUpOtpScreen extends StatefulWidget {
  final String? email;
  const SignUpOtpScreen({super.key, this.email});

  @override
  State<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  var time = 0;
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
                        print("Changed: " + pin);
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
}

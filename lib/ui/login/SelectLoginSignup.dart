import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peaceworc_agency/ui/login/LoginScreen.dart';
import 'package:peaceworc_agency/ui/sign_up/Sign_up_screen.dart';
class SelectLoginSignup extends StatelessWidget {
  const SelectLoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          //statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/new_logo.png")
                  ),
                  Text(
                    'Peaceworc Agency',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(
                    'Share your need by creating a job post',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      'Find the right trusted caregiver for your client',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          child: Text(
                              "Log In",
                              style: TextStyle(fontSize: 18, color: Colors.black)
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
                          onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                          }
                      ),

                      TextButton(
                          child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 18)
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 40, right: 40, top: 13, bottom: 13)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.white)
                                  )
                              )
                          ),
                          onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()))
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

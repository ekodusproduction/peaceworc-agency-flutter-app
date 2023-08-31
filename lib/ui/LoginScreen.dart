import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/HomePage.dart';
import 'package:peaceworc_agency/ui/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/new_logo.png")
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
                Text(
                  'Login to continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: false,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
                  }
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'Do not have an account?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}

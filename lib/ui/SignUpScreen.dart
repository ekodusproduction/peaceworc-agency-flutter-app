import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  'Welcome To Peaceworc',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
                Text(
                  'Register to join',
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
                            labelText: 'Company Name',
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: false,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                      ),
                      SizedBox(height: 10,),
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
                      SizedBox(height: 10,),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: Text(
                                "Register Now",
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
                            onPressed: () => {}
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }
}

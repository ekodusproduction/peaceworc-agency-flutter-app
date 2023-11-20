import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/login_bloc.dart';
import 'package:peaceworc_agency/ui/HomePage.dart';
import 'package:peaceworc_agency/ui/sign_up/Sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidationMixin{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fcmToken = "fcm_token";
  bool isLoading = false;
  bool isObscured = true;
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  void initState() {
    super.initState();
    addLoginListener();
  }

  void login(String email, String password, String fcmToken){
    setState(() {
      isLoading = true;
    });
    loginBloc.login(email, password, fcmToken);
  }
  void addLoginListener() {
    loginBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          final prefs = await SharedPreferences.getInstance();
          setState((){
            prefs.setBool('isLoggedIn', true);
            prefs.setString("full_name", value.data!.name.toString());
            prefs.setString("auth_token", value.token.toString());
            prefs.setString("user_id", value.data!.id.toString());
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
      body: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Form(
              key: formGlobalKey,
              child: Column(
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
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          obscureText: false,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Email Address',
                              labelStyle: TextStyle(color: Colors.white)
                          ),
                          validator: (String? value) {
                            if(!isEmailValidate(value!)){
                              return 'Invalid email address';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: isObscured,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  isObscured ? Icons.visibility
                                      : Icons.visibility_off),
                              color: Colors.white,
                              onPressed: () {
                                setState(
                                      () {
                                        isObscured = !isObscured;
                                  },
                                );
                              },
                            ),
                            errorMaxLines: 3,
                          ),
                          validator: (String? value) {
                            if(isPasswordValid(value!).length != 0){
                              return isPasswordValid(value!);
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  SizedBox(height: 30),
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
                        onPressed: () =>
                        {
                          if(formGlobalKey.currentState!.validate()){
                            formGlobalKey.currentState!.save(),
                            login(emailController.text, passwordController.text, fcmToken)
                          }
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

  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
  }
}

mixin InputValidationMixin{
  bool isEmailValidate(String value){
    if(!RegExp(r"^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$")
        .hasMatch(value!)){
      return false;
    }
    return true;
  }

  String isPasswordValid(String password){
    if(password.length < 6){
      return "Password must be consisted of 6 or more character";
    }
    if(!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,12}$").hasMatch(password!)){
      return "Password should contain at least one lower case, one upper case, one numeric value and one special character";
    }
    return "";
  }
}



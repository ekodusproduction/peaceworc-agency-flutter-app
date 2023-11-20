import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/sign_up_bloc.dart';
import 'package:peaceworc_agency/ui/HomePage.dart';
import 'package:peaceworc_agency/ui/LoginScreen.dart';
import 'package:peaceworc_agency/ui/sign_up/sign_up_otp_screen.dart';

import '../../utils/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with AddClientValidationMixin {
  var companyNameController = TextEditingController();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conPasswordController = TextEditingController();
  bool isPasswordObscured = true;
  bool isConPasswordObscured = true;
  final formGlobalKey = GlobalKey < FormState > ();

  bool isLoading = false;

  @override
  void initState() {
    signUpListener();
    super.initState();
  }
  void signUpListener() {
    signUpBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpOtpScreen(email: emailController.text, company_name: companyNameController.text)));
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
      body: Padding(
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
                        TextFormField(
                          controller: companyNameController,
                          style: TextStyle(color: Colors.white),
                          obscureText: false,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Company Name',
                              labelStyle: TextStyle(color: Colors.white)
                          ),
                          validator: (String? value) {
                            if(isComapnyNameValid(value!).length != 0){
                              return isComapnyNameValid(value!);
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: fullNameController,
                          style: TextStyle(color: Colors.white),
                          obscureText: false,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Full Name',
                              labelStyle: TextStyle(color: Colors.white)
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
                          obscureText: isPasswordObscured,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  isPasswordObscured ? Icons.visibility
                                      : Icons.visibility_off),
                              color: Colors.white,
                              onPressed: () {
                                setState(
                                      () {
                                        isPasswordObscured = !isPasswordObscured;
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
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: conPasswordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: isConPasswordObscured,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  isConPasswordObscured ? Icons.visibility
                                      : Icons.visibility_off),
                              color: Colors.white,
                              onPressed: () {
                                setState(
                                      () {
                                        isConPasswordObscured = !isConPasswordObscured;
                                        },
                                );
                              },
                            ),
                            errorMaxLines: 3,
                          ),
                          validator: (String? value) {
                            if(isConPasswordValid(value!, passwordController.text).length != 0){
                              return isConPasswordValid(value!, passwordController.text);
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              onPressed: () => {
                                if(formGlobalKey.currentState!.validate()){
                                  formGlobalKey.currentState!.save(),
                                  signUpBloc.signUp(companyNameController.text, fullNameController.text, emailController.text, passwordController.text, conPasswordController.text, "fcm_token")
                                }
                              }
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

  @override
  void dispose() {
    signUpBloc.dispose();
    super.dispose();
  }
}

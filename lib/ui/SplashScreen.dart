import 'dart:async';
import 'package:flutter/material.dart';
import 'package:peaceworc_agency/main.dart';
import 'package:peaceworc_agency/ui/HomePage.dart';
import 'package:peaceworc_agency/ui/SelectLoginSignup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    _prefs.then((SharedPreferences prefs) {
      Timer(
          Duration(seconds: 3),
              () {
            if(prefs.getBool("isLoggedIn") == true){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            }else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectLoginSignup()));
            }
          });
      return false;
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                  height: 150,
                  child: Image.asset("assets/images/new_logo.png")
              ),
              Text(
                "Peaceworc Agency",
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                )
              ),
            ],
          )
      ),
    );
  }
}

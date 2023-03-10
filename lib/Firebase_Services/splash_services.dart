import 'dart:async';
import 'package:attendance_system/UI/Attendance_Screen/HomeScreen.dart';
import 'package:attendance_system/UI/Attendance_Screen/profileScreen.dart';
import 'package:attendance_system/UI/Authentication/Login_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServics
{
  void isLogin(BuildContext context) async
  {

    FirebaseAuth _auth = FirebaseAuth.instance;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final user2 = sharedPreferences.get("employeeId").toString();

    final user1 = _auth.currentUser;

    if(user1 != null && user2 != null)
      {
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(emailId: user2,)))
        );
      }
    else
      {
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
        );
      }
  }
}
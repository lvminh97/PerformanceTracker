// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:session_management/factory/AccountFactory.dart';
import 'package:session_management/factory/SessionFactory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<StatefulWidget> {

  late TextEditingController usernameTxtCtl, passwordTxtCtl;

  @override
  void initState() {
    super.initState();
    usernameTxtCtl = TextEditingController();
    passwordTxtCtl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent
          ),
          child: Container(
            width: 100.w,
            height: 100.h,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom != 0.0 ? 10.h : 25.h),
                Text(
                  "LOG IN",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 85.w,
                  child: TextField(
                    controller: usernameTxtCtl,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide.none
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Colors.grey
                        ),
                        hintText: "Username",
                        counterStyle: const TextStyle(height: double.minPositive),
                        counterText: ""
                    ),
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 85.w,
                  child: TextField(
                    controller: passwordTxtCtl,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide.none
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.grey
                        ),
                        hintText: "Password",
                        counterStyle: const TextStyle(height: double.minPositive),
                        counterText: ""
                    ),
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 50.w,
                  height: 6.5.h,
                  child: TextButton(
                    onPressed: login,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.w)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      backgroundColor: Colors.white
                    ),
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 4.h,
                  child: Text(
                    "New user?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white
                    ),
                  )
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  width: 50.w,
                  height: 6.5.h,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/register", (route) => false);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.w)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      backgroundColor: Colors.white
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if(await AccountFactory.login(usernameTxtCtl.text, passwordTxtCtl.text)) {
    // if(true) {
      await SessionFactory.loadSessionList();
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    }
    else {
      Fluttertoast.showToast(
          msg: "Username or password is wrong. Please try again!",
          toastLength:Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade700,
          textColor: Colors.white,
          fontSize: 14.sp
      );
    }
  }
}
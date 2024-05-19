// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:session_management/factory/AccountFactory.dart';
import 'package:session_management/factory/SessionFactory.dart';
import 'package:sizer/sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }

}

class RegisterState extends State<StatefulWidget> {

  late TextEditingController usernameTxtCtl, emailtxtCtl, passwordTxtCtl, passwordTxtCtl2;

  @override
  void initState() {
    super.initState();
    usernameTxtCtl = TextEditingController();
    emailtxtCtl = TextEditingController();
    passwordTxtCtl = TextEditingController();
    passwordTxtCtl2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      },
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
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom != 0.0 ? 5.h : 15.h),
                Text(
                  "SIGN UP",
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
                    controller: emailtxtCtl,
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
                        hintText: "Email",
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
                    autofocus: false,
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
                SizedBox(height: 2.h),
                SizedBox(
                  width: 85.w,
                  child: TextField(
                    controller: passwordTxtCtl2,
                    autofocus: true,
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
                        hintText: "Confirm password",
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
                    onPressed: register,
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
                SizedBox(height: 10.h),
                SizedBox(
                    height: 4.h,
                    child: Text(
                      "Already a user?",
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
                      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                    },
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if(await AccountFactory.register(usernameTxtCtl.text, emailtxtCtl.text, passwordTxtCtl.text, passwordTxtCtl2.text)) {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }
}
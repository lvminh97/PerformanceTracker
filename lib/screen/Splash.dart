// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }

}

class SplashState extends State<StatefulWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    });
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.white54
            ),
            child: Container(
              width: 100.w,
              height: 100.h,
              alignment: Alignment.center,
              child: SizedBox(
                width: 70.w,
                height: 70.w,
                child: const Image(
                  image: AssetImage("assets/images/performance.png"),
                ),
              )
            ),
          )
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:session_management/screen/AddSession.dart';
import 'package:session_management/screen/Home.dart';
import 'package:session_management/screen/Login.dart';
import 'package:session_management/screen/Register.dart';
import 'package:session_management/screen/Report.dart';
import 'package:session_management/screen/Splash.dart';

class MyRoutes {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    "/splash": (context) => const Splash(),
    "/register": (context) => const Register(),
    "/login": (context) => const Login(),
    "/home": (context) => const Home(),
    "/add_session": (context) => const AddSession(),
    "/report": (context) => const Report(),
  };
  static const String _init = "/splash";

  static Map<String, Widget Function(BuildContext)> getRoutes(){
    return _routes;
  }

  static String getInit(){
    return _init;
  }
}
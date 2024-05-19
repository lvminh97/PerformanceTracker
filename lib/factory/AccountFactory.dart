import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:session_management/model/account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class AccountFactory {

  static Account? account;

  static Future<bool> login(String username, String password) async {
    var prefs = await SharedPreferences.getInstance();
    var accounts = jsonDecode(prefs.getString("accounts") ?? "[]") as List;
    for(int i = 0; i < accounts.length; i++) {
      if(username == accounts[i]["username"] && password == accounts[i]["password"]) {
        account = Account(accounts[i]["username"], accounts[i]["password"], accounts[i]["email"]);
        return true;
      }
    }
    return false;
  }

  static Future<bool> register(String username, String email, String password, String password2) async {
    if(username.isEmpty) {
      Fluttertoast.showToast(
          msg: "Username must be not empty!",
          toastLength:Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade700,
          textColor: Colors.white,
          fontSize: 14.sp
      );
      return false;
    }

    if(password != password2) {
      Fluttertoast.showToast(
          msg: "Password is mismatch!",
          toastLength:Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade700,
          textColor: Colors.white,
          fontSize: 14.sp
      );
      return false;
    }

    var prefs = await SharedPreferences.getInstance();
    var accounts = jsonDecode(prefs.getString("accounts") ?? "[]") as List;
    accounts.add({
      "username": username,
      "email": email,
      "password": password
    });
    await prefs.setString("accounts", jsonEncode(accounts));
    return true;
  }
}
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:session_management/factory/AccountFactory.dart';
import 'package:session_management/factory/SessionFactory.dart';
import 'package:session_management/model/account.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatelessWidget{

  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Medicine Reminder",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp
                  ),
                ),
              )
          ),
          ListTile(
            title: Text(AccountFactory.account!.username),
            leading: Icon(Icons.person, size: 20.sp),
            onTap: () {
            },
          ),
          ListTile(
            title: Text(AccountFactory.account!.email),
            leading: Icon(Icons.email, size: 20.sp),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text("Log out"),
            leading: Icon(Icons.logout, size: 20.sp),
            onTap: () {
              AccountFactory.account = null;
              SessionFactory.sessionList.clear();
              Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
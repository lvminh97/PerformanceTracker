import 'dart:convert';

import 'package:session_management/model/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionFactory {

  static List<Session> sessionList = [];

  static Future<void> loadSessionList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storagedData = prefs.getString("sessions") ?? "[]";
    try {
      var sessionsObj = jsonDecode(storagedData) as List;
      for (int i = 0; i < sessionsObj.length; i++) {
        sessionList.add(Session(
            sessionsObj[i]["name"], sessionsObj[i]["fluency"],
            sessionsObj[i]["temperament"]));
      }
    }
    catch (error) {
      await prefs.setString("sessions", "[]");
    }
  }

  static Future<void> saveSessionList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sessions", jsonEncode(sessionList));
  }

}
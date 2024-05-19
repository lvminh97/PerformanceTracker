// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:session_management/factory/SessionFactory.dart';
import 'package:session_management/model/session.dart';
import 'package:sizer/sizer.dart';

class AddSession extends StatefulWidget {
  const AddSession({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddSessionState();
  }

}

class AddSessionState extends State<StatefulWidget> {

  TextEditingController sessionNameTxtCtl = TextEditingController();
  ValueNotifier<double> fluencyNtf = ValueNotifier(0), temperamentNtf = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.lightBlueAccent
          ),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Column(
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 5.h,
                  child: Row(
                    children: [
                      SizedBox(width: 2.w,),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                          },
                          child: Icon(
                            Icons.chevron_left,
                            size: 100.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "CREATE NEW SESSION",
                          style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 4.h,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "Session name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 85.w,
                  child: TextField(
                    controller: sessionNameTxtCtl,
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.w)),
                            borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.w)),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.w)),
                            borderSide: BorderSide.none
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Colors.grey
                        ),
                        hintText: "",
                        counterStyle: const TextStyle(height: double.minPositive),
                        counterText: ""
                    ),
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 4.h,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: ValueListenableBuilder(
                          valueListenable: fluencyNtf,
                          builder: (context, value, child) => Text(
                            "Fluency: ${fluencyNtf.value.round()}%",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 96.w,
                  child: ValueListenableBuilder(
                    valueListenable: fluencyNtf,
                    builder: (context, value, child) => Slider(
                      onChanged: (value) {
                        fluencyNtf.value = value;
                      },
                      value: fluencyNtf.value,
                      activeColor: Colors.black,
                      min: 0,
                      max: 100,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 4.h,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: ValueListenableBuilder(
                          valueListenable: temperamentNtf,
                          builder: (context, value, child) => Text(
                            "Temperament: ${temperamentNtf.value.round()}%",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 96.w,
                  child: ValueListenableBuilder(
                    valueListenable: temperamentNtf,
                    builder: (context, value, child) => Slider(
                      onChanged: (value) {
                        temperamentNtf.value = value;
                      },
                      value: temperamentNtf.value,
                      activeColor: Colors.black,
                      min: 0,
                      max: 100,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 90.w,
                  child: TextButton(
                    onPressed: () async {
                      Session newSession = Session(sessionNameTxtCtl.text, fluencyNtf.value.round(), temperamentNtf.value.round());
                      SessionFactory.sessionList.add(newSession);
                      await SessionFactory.saveSessionList();
                      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.w)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        backgroundColor: Colors.white
                    ),
                    child: Text(
                      "CREATE",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
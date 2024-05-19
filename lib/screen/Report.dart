// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:session_management/factory/SessionFactory.dart';
import 'package:sizer/sizer.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<StatefulWidget> createState() {
    return ReportState();
  }

}

class ReportState extends State<StatefulWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var routeMap = ModalRoute.of(context)!.settings.arguments as Map;
    var session = SessionFactory.sessionList[routeMap["session_number"]];
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
          child: Container(
            width: 100.w,
            height: 100.h,
            alignment: Alignment.center,
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
                      SizedBox(width: 5.w,),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "REPORT",
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
                SizedBox(
                  width: 90.w,
                  height: 4.5.h,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      session.name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: Text(
                          "Fluency",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 45.w,
                        child: CircularPercentIndicator(
                          radius: 20.w,
                          lineWidth: 2.w,
                          percent: session.fluency / 100,
                          center: Text(
                              "${session.fluency}%",
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )
                          ),
                          backgroundColor: Colors.white,
                          progressColor: Colors.purple,
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: Text(
                          "Temperament",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 45.w,
                        child: CircularPercentIndicator(
                          radius: 20.w,
                          lineWidth: 2.w,
                          percent: session.temperament / 100,
                          center: Text(
                            "${session.temperament}%",
                            style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                          ),
                          backgroundColor: Colors.white,
                          progressColor: Colors.purple,
                        ),
                      )
                    ],
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
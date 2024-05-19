// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:session_management/factory/SessionFactory.dart';
import 'package:session_management/widget/MyDrawer.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<StatefulWidget> {

  List<ValueNotifier<bool>> showOptions = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0 ; i < SessionFactory.sessionList.length; i++) {
      showOptions.add(ValueNotifier(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
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
                SizedBox(height: 3.h),
                SizedBox(
                  height: 5.h,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      "SESSION LIST",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  width: 90.w,
                  height: 60.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: SessionFactory.sessionList.length,
                    itemBuilder: (context, index) => ValueListenableBuilder(
                      valueListenable: showOptions[index],
                      builder: (BuildContext context, bool value, Widget? child) => Container(
                        margin: EdgeInsets.only(bottom: 1.h),
                        width: showOptions[index].value ? 80.w : 90.w,
                        height: 10.h,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.w),
                                color: const Color.fromARGB(220, 255, 255, 255)
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if(showOptions[index].value) {
                                    showOptions[index].value = false;
                                  }
                                  else {
                                    Navigator.pushNamedAndRemoveUntil(context, "/report", (route) => false,
                                      arguments: {
                                        "session_number": index
                                      }
                                    );
                                  }
                                },
                                onLongPress: () {
                                  showOptions[index].value = true;
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.w)
                                  ),
                                  padding: EdgeInsets.zero
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 3.w),
                                    Container(
                                      width: 15.w,
                                      height: 9.h,
                                      alignment: Alignment.center,
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: CircularPercentIndicator(
                                          radius: 8.w,
                                          lineWidth: 1.w,
                                          percent: ((SessionFactory.sessionList[index].fluency + SessionFactory.sessionList[index].temperament) / 2) / 100,
                                          center: Text(
                                              "${((SessionFactory.sessionList[index].fluency + SessionFactory.sessionList[index].temperament) / 2).round()}%",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                          progressColor: Colors.purple,
                                        ),
                                      )
                                    ),
                                    SizedBox(width: 4.w),
                                    SizedBox(
                                      width: showOptions[index].value ? 55.w : 65.w,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            SessionFactory.sessionList[index].name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.black
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            showOptions[index].value ?
                                            "" :
                                            "Fluency ${SessionFactory.sessionList[index].fluency}% - Temperament ${SessionFactory.sessionList[index].temperament}%",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if(showOptions[index].value) SizedBox(
                              width: 10.w,
                              child: TextButton(
                                onPressed: () {
                                  deleteSession(index);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30.sp,
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 90.w,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/add_session", (route) => false);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.w)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      backgroundColor: Colors.white
                    ),
                    child: Text(
                      "CREATE A NEW SESSION",
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
        drawer: MyDrawer(),
      ),
    );
  }

  void deleteSession(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          "Do you confirm to delete this session?",
          style: TextStyle(
              fontSize: 14.sp
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey
                ),
              )
          ),
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                SessionFactory.sessionList.removeAt(index);
                await SessionFactory.saveSessionList();
                Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
              },
              child: Text(
                "OK",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.lightBlueAccent
                ),
              )
          )
        ],
      ),
    );
  }
}
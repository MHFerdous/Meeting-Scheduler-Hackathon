import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/widgets/appbar_method.dart';
import 'package:task_scheduler/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:task_scheduler/presentation/ui/widgets/homepage_card_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

class HostHomeScreen extends StatefulWidget {
  const HostHomeScreen({super.key});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _HostHomeScreenState extends State<HostHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: //customisedAppBar(scaffoldKey),
      customisedAppBar( scaffoldKey, context),*/

      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  alignment: Alignment(
                    ScreenUtil().setWidth(0),
                    ScreenUtil().setHeight(0),
                  ),
                  children: [
                    SizedBox(
                      width: 355.w,
                      height: 150.h,
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              ScreenUtil().setWidth(0),
                            ),
                            bottomRight: Radius.circular(
                              ScreenUtil().setWidth(0),
                            ),
                            topLeft: Radius.circular(
                              ScreenUtil().setWidth(40),
                            ),
                            topRight: Radius.circular(
                              ScreenUtil().setWidth(40),
                            ),
                          ),
                          side: BorderSide(
                              color: const Color(0x999B9B9B), width: 1.w),
                        ),
                        color: const Color(0xFFCBD0F9),
                      ),
                    ),
                    Positioned(
                      top: 10.h, // Adjust top position as needed
                      child: Text(
                        "Today's Schedule",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Meeting",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '7',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 355.w,
                  height: 45.h,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          ScreenUtil().setWidth(40),
                        ),
                        bottomRight: Radius.circular(
                          ScreenUtil().setWidth(40),
                        ),
                        topLeft: Radius.circular(
                          ScreenUtil().setWidth(0),
                        ),
                        topRight: Radius.circular(
                          ScreenUtil().setWidth(0),
                        ),
                      ),
                      side: BorderSide(
                          color: const Color(0x999B9B9B), width: 1.w),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: 'Status',
                      color: 0xFFACFFDC,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 71.w,
                    ),
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: 'Slot List',
                      color: 0xFFFFE8D2,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 300.h,
                                width: 500.w,
                                child: AlertDialog(
                                  title: Center(
                                    child: Text(
                                      "Exam Routine",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  content: InteractiveViewer(
                                    maxScale: 7.0,
                                    minScale: 0.1,
                                    child: Image.asset(
                                      "assets/images/Bus Time.jpg",
                                      width: 500.w,
                                      height: 300.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(20),
                    ),
                    /*onTap: () {
                      Get.find<FacMainBottomNavController>().changeScreen(3);
                    },*/
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFFF8FFAC),
                      child: Icon(
                        Icons.add,
                        size: 30.sp,
                        color: Colors.black,
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

/*  Widget buildAnnouncementCard(String announcement) {
    return GestureDetector(
      onLongPress: () {
        _timer.cancel();
      },
      onLongPressEnd: (_) {
        startTimer();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0x999B9B9B)),
          borderRadius: BorderRadius.circular(33.w),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              announcement,
              style: TextStyle(
                  fontSize: 24.sp,
                  wordSpacing: .5,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0D6858),
                  height: 1.45
              ),
            ),
          ),
        ),
      ),
    );
  }*/
}

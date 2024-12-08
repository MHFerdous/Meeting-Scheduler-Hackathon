import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/data/services/network_caller.dart';
import 'package:task_scheduler/data/utility/urls.dart';
import 'package:task_scheduler/presentation/state_holders/auth_controller.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_create_meeting_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/appbar_method.dart';
import 'package:task_scheduler/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:task_scheduler/presentation/ui/widgets/homepage_card_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../../../data/models/host_models/most_booked_model.dart';

class HostHomeScreen extends StatefulWidget {
  const HostHomeScreen({super.key});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _HostHomeScreenState extends State<HostHomeScreen> {

  MostBookedModel mostBookedModel = MostBookedModel();
  bool inProgress = false;


  @override
  void initState() {
    super.initState();
    getMostBooked();
  }
  Future<void> getMostBooked() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkCaller()
        .getMethod(Urls.hostMostBooked('host@yahoo.com'));

    if (response != null) {
      mostBookedModel = MostBookedModel.fromJson(response);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed',
                style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.red));
      }
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
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
                                          fontSize: 15.sp,
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
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Current Time & Date',
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFF393939)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CardElevatedButton(
                    width: 355.w,
                    height: 75.h,
                    text: 'Create Slots',
                    color: 0xFFF8FFAC,
                    onTap: () {
                      Get.to(
                        () => const HostCreateMeetingScreen(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  showTable(),
                  SizedBox(
                    height: 23.h,
                  ),
                  CardElevatedButton(
                    width: 355.w,
                    height: 75.h,
                    text: 'Analytics',
                    color: 0xFFCBD0F9,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showTable() {
    return Padding(
      padding: EdgeInsets.only(left: 3.0.w),
      child: Stack(
        children: [
          Container(
            width: 360.w,
            height: 350.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.w),
                color: const Color(0xFFFFFFFF)
            ),
            child: ListView.separated(
              itemCount: mostBookedModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    mostBookedModel.data?[index].title ?? 'Unknown',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  subtitle: Text(
                    '${mostBookedModel.data?[index].startDate} (${mostBookedModel.data?[index].startTime}) To ${mostBookedModel.data?[index].endDate}  (${mostBookedModel.data?[index].endTime})',
                    style: TextStyle(
                      color: const Color(0xFF0D6858),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right,
                      size: 35.w,
                    ), color: Colors.teal,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

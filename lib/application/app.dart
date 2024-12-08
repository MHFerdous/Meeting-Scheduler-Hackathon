import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_auth/guest_login_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_auth/guest_signup_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_edit_profile_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_edit_profile_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_login_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/main_screen.dart';
import 'package:task_scheduler/presentation/ui/utility/app_colors.dart';

import 'controller_binders.dart';

class MeetingScheduler extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const MeetingScheduler({super.key});

  @override
  MeetingSchedulerState createState() => MeetingSchedulerState();
}

class MeetingSchedulerState extends State<MeetingScheduler> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 933),
      builder: (context, child) => GetMaterialApp(
        useInheritedMediaQuery: true,
        navigatorKey: MeetingScheduler.globalKey,
        home: GuestLogInScreen(),
        initialBinding: GetXBindings(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              backgroundColor: const Color(0xFFCBD0F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w),
              ),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF505050),
                fontWeight: FontWeight.bold),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(20.w),
            ),
            disabledBorder: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

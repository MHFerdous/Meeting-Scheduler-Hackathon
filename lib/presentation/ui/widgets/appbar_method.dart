import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/state_holders/auth_controller.dart';
import '../screens/main_screen.dart';
import 'app_logo.dart';

AppBar customisedAppBar( GlobalKey<ScaffoldState> scaffoldKey,
    BuildContext context, int check) {
  String name;
  if(check == 1){
    name = "HOST";
  }
  else if(check == 0){
    name = "GUEST";
  }
  else{
    name = "Admin";
  }
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 2.h,
    leading: IconButton(
      icon: const AppLogo(),
      onPressed: () {
        //scaffoldKey.currentState!.openDrawer();
        Get.to(const HostGuestChoiceScreen());
      },
    ),
    title: Text(
      //appBarAuth.toString(),
      AuthController.email?.toString() ?? name,
      style: TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.w500,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Logout",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900),
                ),
                content: Text(
                  "Are you sure you want to logout?",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "NO",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AuthController.checkLoginState();
                    },
                    child: Text(
                      "YES",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.red,
        ),
      )
    ],
    centerTitle: true,
  );
}

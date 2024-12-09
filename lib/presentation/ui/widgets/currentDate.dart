import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var date = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    updateDate();
  }

  void updateDate() {
    Future.delayed(const Duration(seconds: 1), () {
      date.value = DateTime.now();
      updateDate();
    });
  }

  String get formattedDay => DateFormat.EEEE().format(date.value);
}

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DateController>(
      init: DateController(),
      builder: (controller) {
        var date = controller.date.value;
        var formattedDate = DateFormat.yMMMMd().format(date);
        var formattedTime = DateFormat.jm().format(date);
        var formattedDay = DateFormat.EEEE().format(date);
        return Text(
          "$formattedDay - $formattedDate | $formattedTime",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: Colors.black, fontSize: 18.sp),
        );
      },
    );
  }
}

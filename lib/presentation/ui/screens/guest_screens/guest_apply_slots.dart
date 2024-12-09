import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_scheduler/data/services/network_caller.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../../../data/utility/urls.dart';
import '../../widgets/appbar_method.dart';
import '../../widgets/customised_elevated_button.dart';

class GuestApplySlots extends StatefulWidget {
  const GuestApplySlots({super.key, required this.topic, required this.startDate, required this.startTime, required this.endDate, required this.endTime, required this.meetingAddress, required this.remaining, required this.id});

  final String topic;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String meetingAddress;
  final String remaining;
  final String id;


  @override
  State<GuestApplySlots> createState() => _GuestApplySlotsState();
}

class _GuestApplySlotsState extends State<GuestApplySlots> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _guestName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context,0),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Topic: ',
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.topic,
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Text(
                "Date & Time",
                style:
                TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          widget.startDate,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          widget.startTime,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "TO",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          widget.endDate,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          widget.endTime,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Padding(
                padding:  EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Time Zone - ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "10.00 PM",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.h),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Meeting Address - ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.meetingAddress,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Booking',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 340.w,
                child: TextFormField(
                  controller: _guestName,
                  textInputAction: TextInputAction.next,
                  decoration:
                  const InputDecoration(hintText: 'Guest Name'),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Slot Remaining: ${widget.remaining}',
                style:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.h),
              CustomisedElevatedButton(
                  onTap: () async {

                    final response = await NetworkCaller().getMethod(Urls.bookedUserInfo(_guestName.text, widget.id));
                    if (response != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Book message sent', style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.green));
                      //availableHostModel = AvailableHostModel.fromJson(response);
                    } else {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Slot not available', style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.red));
                      }
                    }

                  },
                  text: 'Book'),
            ],
          ),
        ),
      ),
    );
  }
}
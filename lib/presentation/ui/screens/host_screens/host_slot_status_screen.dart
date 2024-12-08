import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../widgets/appbar_method.dart';

class HostSlotStatusScreen extends StatefulWidget {
  const HostSlotStatusScreen({super.key, required this.topic, required this.startDate, required this.startTime, required this.endDate, required this.endTime, required this.meetingAddress, required this.remaining});
  final String topic;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String meetingAddress;
  final String remaining;


  @override
  State<HostSlotStatusScreen> createState() => _HostSlotStatusScreenState();
}

class _HostSlotStatusScreenState extends State<HostSlotStatusScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
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
                SizedBox(height: 40.h),
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
                Row(
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
                      "Fetch from api",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Meeting Address: ${widget.meetingAddress}',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Booked:',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16.h),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 8.w,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontSize: 26.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Slot Remaining: ${widget.remaining}',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        'Guest Names:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      ),
                    ),
                    ListView.separated(
                      itemCount: 10,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: ListTile(
                            leading: Container(
                              width: 26.w,
                              height: 26.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0D6858),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14, // Adjust size as needed
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              'Guest name form backu',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 0,
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
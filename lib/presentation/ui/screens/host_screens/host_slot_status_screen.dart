import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../../../data/models/host_models/booked_user_model.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import '../../widgets/appbar_method.dart';

class HostSlotStatusScreen extends StatefulWidget {
  const HostSlotStatusScreen(
      {super.key,
      required this.topic,
      required this.startDate,
      required this.startTime,
      required this.endDate,
      required this.endTime,
      required this.meetingAddress,
      required this.remaining,
      required this.id});

  final String topic;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String meetingAddress;
  final String remaining;
  final String id;

  @override
  State<HostSlotStatusScreen> createState() => _HostSlotStatusScreenState();
}

class _HostSlotStatusScreenState extends State<HostSlotStatusScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BookedUserModel bookedUserModel = BookedUserModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getBookedUser();
  }

  Future<void> getBookedUser() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkCaller()
        .getMethod(Urls.bookedUserInfo('kk@gmail.com', widget.id));

    if (response != null) {
      bookedUserModel = BookedUserModel.fromJson(response);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red));
      }
    }
    inProgress = false;
    setState(() {});
  }

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date); // Parse the date string
    return DateFormat('yyyy-MM-dd')
        .format(parsedDate); // Format it to 'YYYY-MM-DD'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context, 1),
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
                            formatDate(widget.startDate),
                            style: TextStyle(
                              color: const Color(0xFF0D6858),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
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
                            formatDate(widget.endDate),
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: int.parse(widget.remaining) == 78 ? Colors.grey : Colors.blue,
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
                      itemCount: bookedUserModel.data?.length ?? 0,
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
                              bookedUserModel.data?[index + 1].fullName ?? '',
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

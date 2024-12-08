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
import '../../../../data/models/host_models/todays_total_model.dart';
import '../../widgets/customised_elevated_button.dart';

class HostHomeScreen extends StatefulWidget {
  const HostHomeScreen({super.key});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _HostHomeScreenState extends State<HostHomeScreen> {
  MostBookedModel mostBookedModel = MostBookedModel();
  TodayTotalModel todayTotalModel = TodayTotalModel();
  final TextEditingController _topicTEController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _meetingController = TextEditingController();
  bool inProgress = false;

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime today = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.teal,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }
  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.teal,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            timePickerTheme: TimePickerThemeData(
              dialBackgroundColor: Colors.teal.shade100,
              dialHandColor: Colors.teal,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final int hour = pickedTime.hour;
      final int minute = pickedTime.minute;

      // Set the value in 24-hour time format (e.g., `HH:mm`)
      String formattedTime =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

      setState(() {
        controller.text = formattedTime;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getMostBooked();
    getTotal();
  }

  Future<void> getTotal() async{
    inProgress = true;
    setState(() {});
    final response =
    await NetworkCaller().getMethod(Urls.hostTotalMeeting('host@yahoo.com','2024-12-09'));

    if (response != null) {
      todayTotalModel = TodayTotalModel.fromJson(response);
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

  Future<void> getMostBooked() async {
    inProgress = true;
    setState(() {});
    final response =
        await NetworkCaller().getMethod(Urls.hostMostBooked('host@yahoo.com'));

    if (response != null) {
      mostBookedModel = MostBookedModel.fromJson(response);
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
                                      todayTotalModel.data?.toString() ?? '0',
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
                color: const Color(0xFFFFFFFF)),
            child: ListView.separated(
              itemCount: mostBookedModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Do you want to edit or delete?'),
                            content: Text('Are you sure?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel',
                                      style: TextStyle(color: Colors.black))),
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        _topicTEController,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: 'Topic'),
                                                    validator: (String? value) {
                                                      if (value
                                                              ?.trim()
                                                              .isEmpty ??
                                                          true) {
                                                        return 'Please enter your Topic';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(height: 40.h),
                                                  Text(
                                                    "Date & Time",
                                                    style: TextStyle(
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 40.h),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () => _selectDate(
                                                              context,
                                                              _startDateController),
                                                          child: AbsorbPointer(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _startDateController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Start Date",
                                                                border:
                                                                    OutlineInputBorder(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () => _selectTime(
                                                              context,
                                                              _startTimeController),
                                                          child: AbsorbPointer(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _startTimeController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Start Time",
                                                                border:
                                                                    OutlineInputBorder(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 30.h),
                                                  Text(
                                                    "TO",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25.sp),
                                                  ),
                                                  SizedBox(height: 30.h),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () => _selectDate(
                                                              context,
                                                              _endDateController),
                                                          child: AbsorbPointer(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _endDateController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "End Date",
                                                                border:
                                                                    OutlineInputBorder(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () => _selectTime(
                                                              context,
                                                              _endTimeController),
                                                          child: AbsorbPointer(
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _endTimeController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "End Time",
                                                                border:
                                                                    OutlineInputBorder(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 40.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Time Zone - ",
                                                        style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "Fetch from api",
                                                        style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 40.h),
                                                  TextFormField(
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Meeting Link / Address'),
                                                    controller:
                                                        _meetingController,
                                                    validator: (String? value) {
                                                      if (value
                                                              ?.trim()
                                                              .isEmpty ??
                                                          true) {
                                                        return 'Please enter your Meeting Link / Address';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(height: 40.h),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                              TextButton(
                                                onPressed: () async {
                                                  inProgress = true;
                                                  setState(() {});

                                                  final result = await NetworkCaller()
                                                      .postMethod(
                                                          Urls.hostEditSchedule(
                                                              mostBookedModel
                                                                  .data![index]
                                                                  .sId
                                                                  .toString()),
                                                          body: {
                                                        "hostEmail":
                                                            "host@yahoo.com",
                                                        "hostFullName": "hostt",
                                                        "title":
                                                            _topicTEController
                                                                .text,
                                                        "startDate":
                                                            _startDateController
                                                                .text,
                                                        "startTime":
                                                            _startTimeController
                                                                .text,
                                                        "endDate":
                                                            _endDateController
                                                                .text,
                                                        "endTime":
                                                            _endTimeController
                                                                .text,
                                                        "meetingAddress":
                                                            _meetingController
                                                                .text
                                                      });

                                                  inProgress = false;
                                                  setState(() {});

                                                  if (result != null &&
                                                      result.containsKey(
                                                          'status') &&
                                                      result['status'] ==
                                                          'success') {
                                                    _topicTEController.clear();
                                                    _startDateController
                                                        .clear();
                                                    _startTimeController
                                                        .clear();
                                                    _endDateController.clear();
                                                    _endTimeController.clear();
                                                    _meetingController.clear();

                                                    if (mounted) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            'Added successfully!',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ));
                                                    }
                                                  } else {
                                                    if (mounted) {
                                                      //print("API Response: $result");
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            'Edited successfully!',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ));
                                                      Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const HostHomeScreen()),
                                                          (route) => false);
                                                    }
                                                  }
                                                  Navigator.pushAndRemoveUntil(context,
                                                      MaterialPageRoute(
                                                          builder: (context) => const HostHomeScreen()), (
                                                          route) => false);
                                                },
                                                child: const Text(
                                                  'Done',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Text('Edit',
                                      style: TextStyle(color: Colors.black))),
                              TextButton(
                                  onPressed: () async {
                                    inProgress = true;
                                    setState(() {});
                                    await NetworkCaller().getMethod(Urls.hostDeleteSchedule('host@yahoo.com', mostBookedModel.data![index].sId.toString()));
                                    //await NetworkCaller().deleteMethod(Urls.hostDeleteSchedule(AuthController.email.toString(), mostBookedModel.data![index].sId.toString()));
                                    inProgress = false;
                                    setState(() {});
                                    getMostBooked();

                                  },
                                  child: const Text('Delete',
                                      style: TextStyle(color: Colors.black))),
                            ],
                          );
                        });
                  },
                  child: ListTile(
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
                      ),
                      color: Colors.teal,
                    ),
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

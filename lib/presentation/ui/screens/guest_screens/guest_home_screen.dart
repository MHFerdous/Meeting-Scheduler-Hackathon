import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_scheduler/data/services/network_caller.dart';
import 'package:task_scheduler/data/utility/urls.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_apply_slots.dart';
import 'package:task_scheduler/presentation/ui/widgets/appbar_method.dart';
import 'package:task_scheduler/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:task_scheduler/presentation/ui/widgets/homepage_card_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../../../data/models/guest_model/available_host_model.dart';
import '../../../../data/models/host_models/booked_user_model.dart';
import '../../../../data/models/host_models/most_booked_model.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

var _scaffoldKey = GlobalKey<ScaffoldState>();

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  AvailableHostModel availableHostModel = AvailableHostModel();
  BookedUserModel bookedUserModel = BookedUserModel();
  bool inProgress = false;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController hostController = TextEditingController();

  List<Map<String, dynamic>> data = [
    {'date': '08-12-2024', 'time': '14:00', 'host': 'John'},
    {'date': '09-12-2024', 'time': '10:00', 'host': 'Alice'},
    {'date': '10-12-2024', 'time': '18:00', 'host': 'John'},
  ];

  List<Map<String, dynamic>> filteredData = [];

  void applyFilters() {
    String selectedDate = dateController.text;
    String selectedTime = timeController.text;
    String selectedHost = hostController.text.toLowerCase();

    setState(() {
      filteredData = data.where((item) {
        final matchesDate =
            selectedDate.isEmpty || item['date'] == selectedDate;
        final matchesTime =
            selectedTime.isEmpty || item['time'] == selectedTime;
        final matchesHost =
            selectedHost.isEmpty || item['host'].toLowerCase() == selectedHost;

        return matchesDate && matchesTime && matchesHost;
      }).toList();
    });

    // Show filtered data in a dialog box
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtered Results'),
          content: filteredData.isEmpty
              ? const Text('No data matches your criteria.')
              : SizedBox(
                  width: double.maxFinite,
                  height: 350.h,
                  child: ListView.separated(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final item = filteredData[index];
                      return ListTile(
                        title: Text(
                          item['host'] ?? 'Unknown Host',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                        subtitle: Text(
                          '${item['date']} at ${item['time']}',
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
                          color: Colors.black,
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
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
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

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
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
  }

  Future<void> getMostBooked() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkCaller().getMethod(Urls.guestSchedules);

    if (response != null) {
      availableHostModel = AvailableHostModel.fromJson(response);
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
      appBar: customisedAppBar(_scaffoldKey, context),
      body: Scaffold(
        key: _scaffoldKey,
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
                                      "Request",
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
                  showTable(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CardElevatedButton(
                    width: 355.w,
                    height: 75.h,
                    text: 'Filter',
                    color: 0xFFF8FFAC,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Date picker
                                TextField(
                                  controller: dateController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Select Date',
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                  onTap: () =>
                                      _selectDate(context, dateController),
                                ),
                                const SizedBox(height: 10),

                                // Time picker
                                TextField(
                                  controller: timeController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Select Time',
                                    suffixIcon: Icon(Icons.access_time),
                                  ),
                                  onTap: () =>
                                      _selectTime(context, timeController),
                                ),
                                const SizedBox(height: 10),

                                // Host name input
                                TextField(
                                  controller: hostController,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter Host Name',
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Submit button
                                SizedBox(
                                  width: 100.w,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                        inProgress = true;
                                        setState(() {});

                                        final result = await NetworkCaller().postMethod(
                                            Urls.guestSearch,
                                            body: {
                                              "date": dateController.text,
                                              "time": timeController.text,
                                              "hostName": "host"
                                            });

                                        inProgress = false;
                                        setState(() {});
                                        if (result != null && result['message'] == 'success') {
                                          dateController.clear();
                                          timeController.clear();
                                          hostController.clear();

                                          if (mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Found!', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green));
                                            showDialog(context: context, builder: (context){
                                              return AlertDialog(
                                                title: Text('Found'),
                                                content: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 0; i < 100; i++)
                                                       // Check if the index is even
                                                         Text(bookedUserModel.data?[i+1].fullName.toString() ?? 'kkk'),

                                                  ],
                                                ),
                                              );
                                            });
                                          }
                                        } else {
                                          if (mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

                                          }
                                        }
                                    },
                                    child: const Text('Filter'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
              itemCount: availableHostModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    availableHostModel.data?[index].title ?? 'Unknown',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  subtitle: Text(
                    '${availableHostModel.data?[index].startDate} (${availableHostModel.data?[index].startTime}) To ${availableHostModel.data?[index].endDate}  (${availableHostModel.data?[index].endTime})',
                    style: TextStyle(
                      color: const Color(0xFF0D6858),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Get.to(
                        GuestApplySlots(
                          topic: availableHostModel.data?[index].title ?? '',
                          startDate:
                              availableHostModel.data?[index].startDate ?? '',
                          startTime:
                              availableHostModel.data?[index].startTime ?? '',
                          endDate: availableHostModel.data?[index].endDate ?? '',
                          endTime: availableHostModel.data?[index].endTime ?? '',
                          meetingAddress:
                              availableHostModel.data?[index].meetingAddress ?? '',
                          remaining:
                              availableHostModel.data?[index].count.toString() ?? '',
                          id:  availableHostModel.data?[index].sId ?? '',
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_circle_right,
                      size: 35.w,
                    ),
                    color: Colors.teal,
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

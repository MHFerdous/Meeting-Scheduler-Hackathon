import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../widgets/appbar_method.dart';

class HostCreateMeetingScreen extends StatefulWidget {
  const HostCreateMeetingScreen({super.key});

  @override
  State<HostCreateMeetingScreen> createState() =>
      _HostCreateMeetingScreenState();
}

class _HostCreateMeetingScreenState extends State<HostCreateMeetingScreen> {
  // Define controllers for text fields and date/time pickers
  final TextEditingController _topicTEController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free resources
    _topicTEController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  // Function to handle time picking
  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context); // Format time as 12-hour
      });
    }
  }

  // Function to handle date picking
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime today = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today, // Prevent selection of past dates
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context),
      body: ScreenBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              // Topic Input Field
              TextFormField(
                controller: _topicTEController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Topic'),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please enter your Topic';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40.h),

              // Title for Date & Time
              Text(
                "Date & Time",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),

              // Start Date and Time Pickers
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, _startDateController),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _startDateController,
                          decoration: const InputDecoration(
                            labelText: "Start Date",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _selectTime(context, _startTimeController),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _startTimeController,
                          decoration: const InputDecoration(
                            labelText: "Start Time",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // "TO" Text
              Text(
                "TO",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
              SizedBox(height: 30.h),

              // End Date and Time Pickers
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, _endDateController),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _endDateController,
                          decoration: const InputDecoration(
                            labelText: "End Date",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _selectTime(context, _endTimeController),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _endTimeController,
                          decoration: const InputDecoration(
                            labelText: "End Time",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Time Zone - ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Fetch from api ",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          SizedBox(
            height: 40.h,
          ),
              // Meeting Link or Address Field
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Meeting Link / Address'),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please enter your Meeting Link / Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40.h),

              // Participants Info
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Participants - ",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Text(
                        "10",
                        style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              CustomisedElevatedButton(
                onTap: () async {},
                text: 'ADD',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

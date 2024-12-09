import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_home_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_home_screen.dart';
import 'package:task_scheduler/presentation/state_holders/auth_controller.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';
import '../../../../../data/services/network_caller.dart';
import '../../../../../data/utility/urls.dart';
import '../../widgets/appbar_method.dart';

class GuestEditProfileScreen extends StatefulWidget {
  const GuestEditProfileScreen({super.key});

  @override
  State<GuestEditProfileScreen> createState() => _GuestEditProfileScreenState();
}

class _GuestEditProfileScreenState extends State<GuestEditProfileScreen> {
  final TextEditingController _hostFullName = TextEditingController();
  final TextEditingController _hostDesignation = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _timezone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool inProgress = false;

  final List<String> timeZones = [
    'UTC',
    'Asia/Dhaka',
    'America/New_York',
    'Europe/London',
    'Asia/Tokyo',
    'Australia/Sydney',
  ];

  String? selectedTimeZone;

  @override
  void initState() {
    super.initState();
    selectedTimeZone = timeZones[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context,0),
      body: ScreenBackground(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const AppLogo(),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _hostFullName.text.isEmpty ? 'Guest Full Name' : _hostFullName.text,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirmation'),
                              content: TextFormField(
                                controller: _hostFullName,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {}); // Trigger a rebuild to update the text
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                SizedBox(
                  height: 76.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _hostDesignation,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Guest Designation'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your Guest designation';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _companyName,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Company Name'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _contactNumber,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Contact Number'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                // Time Zone Dropdown
                SizedBox(
                  width: 323.w,
                  child: DropdownButtonFormField<String>(
                    value: selectedTimeZone,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTimeZone = newValue!;
                      });
                    },
                    items: timeZones.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(hintText: 'Select Time Zone'),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomisedElevatedButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      inProgress = true;
                      setState(() {});

                      final result = await NetworkCaller().postMethod(
                          Urls.hostProfile,
                          body: {
                            "email": AuthController.email.toString(),
                            "fullName": _hostFullName.text,
                            "title": _hostDesignation.text,
                            "companyName": _companyName.text,
                            "mobile": _contactNumber.text,
                            "timeZone": _timezone.text,
                          });

                      inProgress = false;
                      setState(() {});
                      if (result != null && result['status'] == 'success') {
                        _hostDesignation.clear();
                        _hostFullName.clear();
                        _contactNumber.clear();
                        _companyName.clear();

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Profile Saved Successfully!',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GuestHomeScreen()),
                                  (route) => false);
                        }
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Failed',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    }
                  },
                  text: 'Save',
                ),
                SizedBox(
                  height: 34.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

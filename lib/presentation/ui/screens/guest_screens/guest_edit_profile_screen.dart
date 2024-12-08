import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import '../../../state_holders/auth_controller.dart';
import '../../widgets/appbar_method.dart';

class GuestEditProfileScreen extends StatefulWidget {
  const GuestEditProfileScreen({super.key});

  @override
  State<GuestEditProfileScreen> createState() => _GuestEditProfileScreenState();
}

class _GuestEditProfileScreenState extends State<GuestEditProfileScreen> {
  final TextEditingController _guestFullName = TextEditingController();
  final TextEditingController _guestDesignation = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _timezone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context),
      body: ScreenBackground(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogo(),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Guest Full Name',
                      style: TextStyle(
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
                                  controller: _guestFullName,
                                  decoration: const InputDecoration(
                                      hintText: 'Full Name'),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Done',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            });
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
                    controller: _guestDesignation,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(hintText: 'Guest Designation'),
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
                    decoration:
                        const InputDecoration(hintText: 'Contact Number'),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _timezone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Time Zone'),
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

                      final result = await NetworkCaller()
                          .postMethod(Urls.guestProfile, body: {
                        "email": AuthController.email2.toString(),
                        "fullName": _guestFullName.text,
                        "title": _guestDesignation.text,
                        "companyName": _companyName.text,
                        "mobile": _contactNumber.text,
                        "timeZone": _timezone.text
                      });

                      inProgress = false;
                      setState(() {});
                      if (result != null && result['status'] == 'success') {
                        _guestFullName.clear();
                        _guestDesignation.clear();
                        _contactNumber.clear();
                        _companyName.clear();
                        _timezone.clear();

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Profile Saved Successful!',
                                      style: TextStyle(color: Colors.white)),
                                  backgroundColor: Colors.green));
                          // Navigator.pushAndRemoveUntil(context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HostLogInScreen()), (
                          //         route) => false);
                        }
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed',
                                      style: TextStyle(color: Colors.white)),
                                  backgroundColor: Colors.red));
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

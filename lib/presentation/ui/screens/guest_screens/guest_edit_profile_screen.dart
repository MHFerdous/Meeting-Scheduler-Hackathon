import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../widgets/appbar_method.dart';

class GuestEditProfileScreen extends StatefulWidget {
  const GuestEditProfileScreen({super.key});

  @override
  State<GuestEditProfileScreen> createState() => _GuestEditProfileScreenState();
}

class _GuestEditProfileScreenState extends State<GuestEditProfileScreen> {
  final TextEditingController _hostDesignation = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
              children: [/**/
                const SizedBox(height: 80,),
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
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit),),
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
                    decoration: const InputDecoration(hintText: 'Host Designation'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your host designation';
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
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your Company name';
                      }
                      if (value!.isEmail == false) {
                        return 'Enter a valid email';
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
                    controller: _contactNumber,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Contact Number'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your Company name';
                      }
                      if (value!.isEmail == false) {
                        return 'Enter a valid email';
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
                    decoration: const InputDecoration(hintText: 'Time Zone'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your number';
                      }
                      if (value!.isPhoneNumber == false) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomisedElevatedButton(
                  onTap: () async {
                    Get.to(
                      () => const GuestEditProfileScreen(),
                    );
                  },
                  text: 'LOG IN',
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

/*  Future<void> facSignIn(FacSignInController facLoginController) async {
    final result = await facLoginController.facSignIn(
      _emailTEController.text.trim(),
      */ /*('${_emailTEController.text.trim()}@lus.ac.bd'),*/ /*
      _passTEController.text.trim(),
    );

    if (result) {
      Get.snackbar('Successful!', facLoginController.message);
      Get.offAll(
            () => const FacMainBottomNavBarScreen(),
      );
    } else {
      Get.snackbar('Failed!', facLoginController.message,
          colorText: Colors.redAccent);
    }
  }*/
}

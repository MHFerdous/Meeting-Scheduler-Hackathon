import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/edit_profile_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/password_text_field.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';
import 'package:task_scheduler/presentation/ui/widgets/title_and_subtitle.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleAndSubtitle(title: '', subtitle: ''),
                const AppLogo(),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Host Full Name',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
                  ],
                ),
                SizedBox(
                  height: 76.h,
                ),
                SizedBox(
                  width: 323.w,
                  child: TextFormField(
                    controller: _emailTEController,
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
                    controller: _emailTEController,
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
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Contact Number'),
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
                  height: 12.h,
                ),


                SizedBox(
                  height: 30.h,
                ),
                CustomisedElevatedButton(
                  onTap: () async {
                    Get.to(
                      () => const EditProfileScreen(),
                    );
                  },
                  text: 'LOG IN',
                ),
                /*GetBuilder<FacSignInController>(
                  builder: (facLoginController) {
                    if (facLoginController.facSignInInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          facSignIn(facLoginController);
                        }
                        // Get.to(
                        //   () => const FacHomeScreen(),
                        // );
                      },
                      text: 'SIGN IN',
                    );
                  },
                ),*/
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

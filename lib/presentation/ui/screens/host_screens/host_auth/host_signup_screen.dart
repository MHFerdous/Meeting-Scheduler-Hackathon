import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_login_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';
import 'package:task_scheduler/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/new_confirm_password_text_field.dart';
import '../../../widgets/customised_elevated_button.dart';

class HostSignUpScreen extends StatefulWidget {
  const HostSignUpScreen({super.key, required this.email});
  final String email;

  @override
  State<HostSignUpScreen> createState() => _HostSignUpScreenState();
}

class _HostSignUpScreenState extends State<HostSignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TitleAndSubtitle(
                      title: 'SIGN UP', subtitle: 'Join as a Host'),
                  const AppLogo(),
                  SizedBox(
                    height: 77.h,
                  ),
                  SizedBox(
                    width: 323.w,
                    child: TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please enter your email';
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
                  NewAndConfirmPasswordTextField(
                    passwordTEController: _newPassTEController,
                    confirmPasswordTEController: _confirmPassTEController,
                    isObscure: true,
                    password: 'Password',
                    confirmPassword: 'Confirm Password',
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  CustomisedElevatedButton(
                    onTap: () async {},
                    text: 'SIGN UP',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => const HostLogInScreen(),
                      );
                    },
                    child: Text('Login', style: TextStyle(fontSize: 20.w),),
                  ),
                  /*GetBuilder<FacVerifyOTPController>(
                    builder: (facVerifyOTPController) {
                      if (facVerifyOTPController.facVerifyOTPInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return GetBuilder<FacSignUpController>(
                        builder: (facSignUpController) {
                          return CustomisedElevatedButton(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                verifyOTP(facVerifyOTPController,
                                    facSignUpController);
                              }
                            },
                            text: 'SIGN UP',
                          );
                        },
                      );
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/*  Future<void> verifyOTP(FacVerifyOTPController facVerifyOTPController,
      FacSignUpController facSignUpController) async {
    final result = await facVerifyOTPController.facVerifyOTP(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (result) {
      Get.snackbar('Successful!', facVerifyOTPController.message);
      changePassword(facSignUpController);
    } else {
      Get.snackbar('Failed!', facVerifyOTPController.message,
          colorText: Colors.redAccent);
    }
  }*/

/*  Future<void> changePassword(FacSignUpController facSignUpController) async {
    final result = await facSignUpController.facSignUp(
      widget.email,
      _otpTEController.text.trim(),
      _newPassTEController.text,
    );
    if (result) {
      Get.snackbar('Successful!', facSignUpController.message);
      Get.to(
            () => const FacSignInScreen(),
      );
    } else {
      Get.snackbar('Failed!', facSignUpController.message,
          colorText: Colors.redAccent);
    }
  }*/
}

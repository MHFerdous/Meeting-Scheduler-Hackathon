import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_auth/guest_login_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_login_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';
import 'package:task_scheduler/presentation/ui/widgets/text_fields.dart';
import 'package:task_scheduler/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../../../data/services/network_caller.dart';
import '../../../../../data/utility/urls.dart';
import '../../../widgets/new_confirm_password_text_field.dart';
import '../../../widgets/customised_elevated_button.dart';

class GuestSignUpScreen extends StatefulWidget {
  const GuestSignUpScreen({super.key, required this.email});
  final String email;

  @override
  State<GuestSignUpScreen> createState() => _GuestSignUpScreenState();
}

class _GuestSignUpScreenState extends State<GuestSignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmPassTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;

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
                      title: 'SIGN UP', subtitle: 'Join as a Guest'),
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
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        inProgress = true;
                        setState(() {});

                        final result = await NetworkCaller().postMethod(
                            Urls.guestRegistration,
                            body: {
                              'email': _emailTEController.text.trim(),
                              'password': _confirmPassTEController.text,
                            });

                        inProgress = false;
                        setState(() {});
                        if (result != null && result['status'] == 'success') {
                          _emailTEController.clear();
                          _newPassTEController.clear();
                          _confirmPassTEController.clear();

                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration Successful!', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green));
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                    builder: (context) => const GuestLogInScreen()), (
                                    route) => false);
                          }
                        } else {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

                          }
                        }
                      }
                    },
                    text: 'SIGN UP',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => const GuestLogInScreen(),
                      );
                    },
                    child: Text('Login', style: TextStyle(fontSize: 20.w),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
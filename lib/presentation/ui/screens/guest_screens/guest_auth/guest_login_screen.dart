import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/guest_screens/guest_edit_profile_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_edit_profile_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/password_text_field.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';
import 'package:task_scheduler/presentation/ui/widgets/title_and_subtitle.dart';

import '../../../../../data/services/network_caller.dart';
import '../../../../../data/utility/urls.dart';
import '../../../../state_holders/auth_controller.dart';

class GuestLogInScreen extends StatefulWidget {
  const GuestLogInScreen({super.key});

  @override
  State<GuestLogInScreen> createState() => _GuestLogInScreenState();
}

class _GuestLogInScreenState extends State<GuestLogInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TitleAndSubtitle(title: 'LOG IN', subtitle: 'Guest'),
                const AppLogo(),
                SizedBox(
                  height: 76.h,
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
                PasswordTextField(
                  passwordTEController: _passTEController,
                  isObscure: true,
                  hintText: 'Password',
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
                          Urls.guestLogin,
                          body: {
                            'email': _emailTEController.text.trim(),
                            'password': _passTEController.text,
                          });

                      inProgress = false;
                      setState(() {});
                      if (result != null && result['status'] == 'success') {
                        _emailTEController.clear();
                        _passTEController.clear();

                        await AuthController.saveUserData2(
                            result['data']['email'],
                            result['token']
                        );


                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Successful!',
                                  style: TextStyle(color: Colors.white)),
                                  backgroundColor: Colors.green));


                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const GuestEditProfileScreen()), (
                                  route) => false);
                        }
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Failed',
                                  style: TextStyle(color: Colors.white)),
                                  backgroundColor: Colors.red));
                        }
                      }
                    }
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

}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_signup_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

class HostGuestChoiceScreen extends StatefulWidget {
  const HostGuestChoiceScreen({super.key});

  @override
  State<HostGuestChoiceScreen> createState() => _HostGuestChoiceScreenState();
}

class _HostGuestChoiceScreenState extends State<HostGuestChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 263.h,
              ),
              const AppLogo(),
              SizedBox(
                height: 68.h,
              ),
              CustomisedElevatedButton(
                  onTap: () {
                    Get.to(
                      () => const HostSignUpScreen(email: '',),
                    );
                  },
                  text: 'Host'),
              SizedBox(
                height: 50.h,
              ),
              CustomisedElevatedButton(
                  onTap: () {
                   /* Get.to(
                      () => const StuAvailabilityCheckScreen(),
                    );*/
                  },
                  text: 'Guest'),
            ],
          ),
        ),
      ),
    );
  }
}

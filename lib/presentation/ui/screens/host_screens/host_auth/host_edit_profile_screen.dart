import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_home_screen.dart';
import 'package:task_scheduler/presentation/state_holders/auth_controller.dart';
import 'package:task_scheduler/presentation/ui/widgets/app_logo.dart';
import 'package:task_scheduler/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:task_scheduler/presentation/ui/widgets/screen_background.dart';

import '../../../../../data/services/network_caller.dart';
import '../../../../../data/utility/urls.dart';
import '../../../widgets/appbar_method.dart';

class HostEditProfileScreen extends StatefulWidget {
  const HostEditProfileScreen({super.key});

  @override
  State<HostEditProfileScreen> createState() => _HostEditProfileScreenState();
}

class _HostEditProfileScreenState extends State<HostEditProfileScreen> {
  final TextEditingController _hostFullName = TextEditingController();
  final TextEditingController _hostDesignation = TextEditingController();
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
                const SizedBox(height: 80,),
                const AppLogo(),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Host Full Name',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text('Confirmation'),
                          content: TextFormField(
                            controller: _hostFullName,
                            decoration: const InputDecoration(
                              hintText: 'Full Name'
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);

                            }, child: const Text('Cancel', style: TextStyle(color: Colors.black),)),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text('Done',style: TextStyle(color: Colors.black),),),
                          ],
                        );
                      });
                    }, icon: const Icon(Icons.edit),),
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

                      final result = await NetworkCaller().postMethod(
                          Urls.hostProfile,
                          body: {
                            "email": AuthController.email.toString(),
                            "fullName": _hostFullName.text,
                            "title": _hostDesignation.text,
                            "companyName": _companyName.text,
                            "mobile": _contactNumber.text ,
                            "timeZone": _timezone.text
                          });

                      inProgress = false;
                      setState(() {});
                      if (result != null && result['status'] == 'success') {
                       _hostDesignation.clear();
                       _hostFullName.clear();
                       _contactNumber.clear();
                       _companyName.clear();
                       _timezone.clear();

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Saved Successful!', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green));
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (context) => const HostHomeScreen()), (
                                  route) => false);
                        }
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));

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

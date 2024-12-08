import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomisedElevatedButton extends StatelessWidget {
  const CustomisedElevatedButton(
      {super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323.w,
      height: 58.h,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
        ),
      ),
    );
  }
}

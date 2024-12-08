import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double height;
  final double width;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.height,
    required this.width,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(24),
        ),
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(24),
              ),
              borderSide: const BorderSide(
                color: Color(0x999B9B9B),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(24),
              ),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return null;
            }
            return null;
          },
        ),
      ),
    );
  }
}

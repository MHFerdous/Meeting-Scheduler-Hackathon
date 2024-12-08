import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardElevatedButton extends StatelessWidget {
  const CardElevatedButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final double width, height;
  final int color;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(color),
          elevation: 5,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

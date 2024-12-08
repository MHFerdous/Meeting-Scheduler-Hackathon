import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 131.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 47.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF585858),
            ),
          ),
          SizedBox(
            height: 53.sp,
          ),
        ],
      ),
    );
  }
}

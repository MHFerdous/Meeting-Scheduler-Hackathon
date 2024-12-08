import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_scheduler/presentation/ui/utility/image_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SvgPicture.asset(
        ImageAssets.meetingSchedulerLogoSVG,
        width: 152.w,
        height: 137.h,
      ),
    );
  }
}

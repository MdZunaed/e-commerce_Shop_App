import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velvethue/constant/colors.dart';

import '../constant/text_style.dart';

class MiniButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color borderColor;

  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const MiniButton(
      {super.key,
      required this.text,
      this.color = kWhite,
      this.borderColor = kPriamry,
      this.height = 30,
      this.width = 75,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height?.h,
          width: width?.w,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 1.5.w),
              color: color,
              borderRadius: BorderRadius.circular(6.r)),
          child: Center(child: Text(text, style: kText)),
        ));
  }
}

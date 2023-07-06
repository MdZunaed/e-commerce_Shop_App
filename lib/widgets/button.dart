import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velvethue/constant/colors.dart';

import '../constant/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const CustomButton(
      {super.key,
      required this.text,
      this.color = kSecondary,
      this.height = 42,
      this.width = double.infinity,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height?.h,
          width: width?.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(6.r)),
          child:
              Center(child: Text(text, style: kAction.copyWith(color: kWhite))),
        ));
  }
}

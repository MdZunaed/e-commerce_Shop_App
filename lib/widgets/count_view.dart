import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';

class CountView extends StatelessWidget {
  final String count;
  final String title;

  const CountView({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 60.h,
      decoration: BoxDecoration(
          boxShadow: const [kShadow],
          borderRadius: BorderRadius.circular(10.r),
          color: kWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(count, style: kAction),
          Text(title, style: kText.copyWith(color: kGrey)),
        ],
      ),
    );
  }
}

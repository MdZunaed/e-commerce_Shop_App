import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velvethue/constant/text_style.dart';

class AccItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const AccItem(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 27.r,
      ),
      title: Text(text, style: kAction.copyWith(fontSize: 20.sp)),
      onTap: onTap,
    );
    //     InkWell(
    //   onTap: onTap,
    //   child: Row(children: [
    //     Icon(icon, size: 27.r),
    //     gaph,
    //     Text(text, style: kAction.copyWith(fontSize: 19.sp)),
    //   ]),
    // );
  }
}

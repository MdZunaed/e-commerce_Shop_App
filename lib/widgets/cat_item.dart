import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';

class CatItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const CatItem(
      {super.key, required this.image, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            boxShadow: const [kShadow],
            borderRadius: BorderRadius.circular(10.r),
            color: kWhite),
        child: Column(
          children: [
            Image(
                height: 140.h,
                width: 110.w,
                image: AssetImage(image),
                fit: BoxFit.cover),
            space,
            Text(title, style: kText),
          ],
        ),
      ),
    );
  }
}

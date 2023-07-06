import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/text_style.dart';

class ItemPreview extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String sold;
  final VoidCallback? onTap;

  const ItemPreview(
      {super.key,
      this.onTap,
      required this.image,
      required this.title,
      required this.price,
      required this.sold});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5).r,
        height: 250.h,
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
                height: 190.h,
                width: 150.w,
                child: Image.asset(image, fit: BoxFit.fill)),
            Text(title,
                style: kAction, maxLines: 1, overflow: TextOverflow.ellipsis),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("\$$price | ", style: kText),
                Text("sold: $sold", style: kText.copyWith(color: kGrey))
              ],
            )
          ],
        ),
      ),
    );
  }
}

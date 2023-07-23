import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/others.dart';
import '../../../constant/text_style.dart';
import '../../../widgets/item_view.dart';
import '../product_page.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  const CategoryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: kTitle),
      ),
      body: Padding(
        padding: kPadding.copyWith(top: 0, bottom: 0),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 260.h,
                crossAxisCount: 2,
                //mainAxisSpacing: 5.h,
                crossAxisSpacing: 5.w),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ItemPreview(
                      onTap: () => Get.to(() => const ProductPage()),
                      image: "images/p1.jpg",
                      title: "Tanjim Panjabi",
                      price: "25.00",
                      sold: "287"),
                ],
              );
            }),
      ),
    );
  }
}

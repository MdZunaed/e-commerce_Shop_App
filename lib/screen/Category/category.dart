import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/widgets/cat_item.dart';

import '../../../constant/text_style.dart';
import 'cat_page.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    List catTitle = [
      "Panjabi",
      "Dhuti",
      "Three Piece",
      "Frok Jama",
      "Pure Coton",
      "Jeans Pant",
      "Jubba",
      "Gol Jama",
      "Others...",
    ];
    List catImage = [
      "images/p1.jpg",
      "images/p2.jpg",
      "images/l2.jpg",
      "images/l1.jpg",
      "images/p2.jpg",
      "images/pant.jpg",
      "images/p1.jpg",
      "images/l1.jpg",
      "images/logo.png",
    ];

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("All Category", style: kTitle),
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: const Icon(Icons.shopping_bag), onPressed: () {}),
          ]),
      body: Padding(
        padding: kPadding.copyWith(top: 0, bottom: 0),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 190.h,
                crossAxisCount: 3,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 5.w),
            itemBuilder: (context, index) {
              return CatItem(
                  onTap: () =>
                      Get.to(() => CategoryPage(title: catTitle[index])),
                  image: catImage[index],
                  title: catTitle[index]);
            }),
      ),
    );
  }
}

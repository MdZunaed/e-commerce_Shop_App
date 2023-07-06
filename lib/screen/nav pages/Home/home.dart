import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/screen/product_page.dart';
import 'package:velvethue/widgets/button.dart';
import 'package:velvethue/widgets/item_view.dart';
import 'package:velvethue/widgets/see_all.dart';

import '../../../constant/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("VELVETHUE", style: kHeading),
          centerTitle: true,
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: const Icon(Icons.shopping_bag), onPressed: () {}),
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: kPadding.copyWith(top: 0),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: kBg, borderRadius: BorderRadius.circular(6.r)),
                    child: TextField(
                        style: kText,
                        decoration: const InputDecoration(
                            hintText: "Search Kurta, Clothing, etc..",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search))),
                  )),
              SizedBox(width: 10.w),
              const Expanded(
                  flex: 1,
                  child: CustomButton(text: "Search", color: kPriamry)),
            ]),
            space,
            SizedBox(
                height: 180.h,
                child: Swiper(
                    itemCount: 3,
                    autoplay: true,
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(space: 5)),
                    itemBuilder: (context, index) {
                      return const Image(
                          image: AssetImage("images/banner.png"),
                          fit: BoxFit.cover);
                    })),
            space,
            DefaultTabController(
                length: 4,
                child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kBg, borderRadius: BorderRadius.circular(6.r)),
                    child: TabBar(
                        labelColor: kPriamry,
                        labelStyle: kText,
                        unselectedLabelColor: kGrey,
                        indicatorPadding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 5.w),
                        indicator: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(6.r)),
                        tabs: const [
                          Tab(text: "All"),
                          Tab(text: "Men"),
                          Tab(text: "Women"),
                          Tab(text: "Others"),
                        ]))),
            SeeAll(title: "Most Popular", onTap: () {}),
            SizedBox(
              height: 255.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemPreview(
                      onTap: () => Get.to(() => const ProductPage()),
                      image: (index == 0 || index == 2 || index == 4)
                          ? "images/p1.jpg"
                          : "images/p2.jpg",
                      title: "Tanjim Panjabi",
                      price: "23.00",
                      sold: "308");
                },
              ),
            ),
            SeeAll(title: "New Arrival", onTap: () {}),
            SizedBox(
              height: 255.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemPreview(
                      onTap: () => Get.to(() => const ProductPage()),
                      image: index == 0 ? "images/p2.jpg" : "images/p1.jpg",
                      title: "Thobe Series",
                      price: "25.00",
                      sold: "287");
                },
              ),
            ),
            space,
            SeeAll(title: "Flash Sell", onTap: () {}),
            SizedBox(
              height: 255.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemPreview(
                      onTap: () => Get.to(() => const ProductPage()),
                      image: "images/p1.jpg",
                      title: "বাইচ্ছা লন ১০০",
                      price: "1.20",
                      sold: "2480");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

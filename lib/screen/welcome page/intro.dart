import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/screen/welcome%20page/cookies.dart';
import 'package:velvethue/widgets/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List images = ["images/p1.jpg", "images/p2.jpg"];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Swiper(
                    itemCount: images.length,
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(space: 5)),
                    itemBuilder: (context, index) {
                      return Image(
                          fit: BoxFit.cover, image: AssetImage(images[index]));
                    })),
            Expanded(
                flex: 1,
                child: Container(
                  margin: kPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("VELVETHUE", style: kHeading),
                      Text(
                          "Feel free to modify or combine words to create a name that suits your brand's style and aesthetic.",
                          style: kText),
                      const Spacer(),
                      CustomButton(
                          text: "Next",
                          onTap: () {
                            Get.to(() => const CookiePage());
                          }),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

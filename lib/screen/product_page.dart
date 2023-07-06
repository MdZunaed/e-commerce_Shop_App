import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/widgets/button.dart';
import 'package:velvethue/widgets/mini_button.dart';

import 'nav pages/Cart/cart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                Get.to(() => const Cart());
              },
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: kPadding.copyWith(top: 0),
        child: Column(
          children: [
            Container(
                height: 350,
                color: kBg,
                child: Image.asset("images/p1.jpg", fit: BoxFit.fill)),
            space,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  flex: 5,
                  child: Text(
                      "Tanjim Panjabi : Premium quality, orginal cotton",
                      style: kAction,
                      maxLines: 3)),
              Expanded(flex: 1, child: Text("\$30.00", style: kTitle))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundImage: const AssetImage("images/logo.png"),
                  ),
                  gaph,
                  Text("VELVETHUE", style: kTitle)
                ],
              ),
              const MiniButton(text: "Visit Store", borderColor: kSecondary),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButtonHideUnderline(
                    child: DropdownButton(
                  hint: const Text("Select Size"),
                  items: [DropdownMenuItem(child: Text("XL", style: kText))],
                  dropdownColor: kBg,
                  onChanged: (value) {},
                )),
                DropdownButtonHideUnderline(
                    child: DropdownButton(
                  hint: const Text("Select Color"),
                  items: [
                    DropdownMenuItem(child: Text("Cole Black", style: kText))
                  ],
                  dropdownColor: kBg,
                  onChanged: (value) {},
                )),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove, color: kSecondary)),
                    Text("1", style: kText),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: kSecondary)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10).r,
        child: Row(
          children: [
            const Expanded(child: CustomButton(text: "Buy Item")),
            SizedBox(width: 10.w),
            const Expanded(
                child: CustomButton(text: "Add to Cart", color: kPriamry)),
            gaph,
            InkWell(onTap: () {}, child: const Icon(Icons.favorite_outline))
          ],
        ),
      ),
    );
  }
}

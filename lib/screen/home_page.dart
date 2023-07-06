import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/controller/nav_bar.dart';
import 'nav pages/Accont/account.dart';
import 'nav pages/Cart/cart.dart';
import 'nav pages/Category/category.dart';
import 'nav pages/Home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NavController());
    var navBarItem = [
      BottomNavigationBarItem(
          icon: Obx(() => (controller.currentIndex.value == 0)
              ? const Icon(Icons.home)
              : const Icon(Icons.home_outlined)),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Obx(() => (controller.currentIndex.value == 1)
              ? const Icon(Icons.find_in_page)
              : const Icon(Icons.find_in_page_outlined)),
          label: "Category"),
      BottomNavigationBarItem(
          icon: Obx(() => (controller.currentIndex.value == 2)
              ? const Icon(Icons.shopping_bag)
              : const Icon(Icons.shopping_bag_outlined)),
          label: "My Cart"),
      BottomNavigationBarItem(
          icon: Obx(() => (controller.currentIndex.value == 3)
              ? const Icon(Icons.person)
              : const Icon(Icons.person_outline)),
          label: "Account"),
    ];
    var navBarBody = [
      const Home(),
      const Category(),
      const Cart(),
      const Account(),
    ];
    return Scaffold(
      body: Obx(() => Column(
            children: [
              Expanded(
                  child: navBarBody.elementAt(controller.currentIndex.value))
            ],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBg,
          selectedLabelStyle: kText,
          unselectedItemColor: kGrey,
          selectedItemColor: kPriamry,
          items: navBarItem,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
        ),
      ),
    );
  }
}

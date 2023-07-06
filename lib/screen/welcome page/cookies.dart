import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velvethue/screen/auth/login.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/widgets/button.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: kPadding,
        child: Column(children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("🍪 COOKIES 🍪", style: kHeading),
                Text(
                    "VELVETHUE uses cookies to ensure you get the best experience on our App",
                    style: kText),
              ])),
          Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            CustomButton(
                text: "Accept",
                onTap: () {
                  Get.to(() => const LoginPage());
                })
          ])),
        ]),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/screen/auth/login.dart';
import 'package:velvethue/screen/nav%20pages/Accont/edit_acc.dart';
import 'package:velvethue/widgets/acc_item.dart';
import 'package:velvethue/widgets/count_view.dart';
import 'package:velvethue/widgets/mini_button.dart';

import '../../../constant/text_style.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthController());
    logout() {
      Get.defaultDialog(
        title: "Alert!",
        content: Text("Are you sure to logout?", style: kAction),
        cancel: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("cancel", style: kTitle)),
        confirm: TextButton(
            onPressed: () async {
              await authController.signoutMethod();
              Get.offAll(() => const LoginPage());
            },
            child: Text("ok", style: kTitle.copyWith(color: Colors.red))),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text("My Account", style: kTitle),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.edit_square),
                onPressed: () {
                  Get.to(() => const EditAccount());
                })
          ]),
      body: Padding(
        padding: kPadding.copyWith(top: 0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                CircleAvatar(
                    radius: 25.r,
                    backgroundImage: const AssetImage("images/logo.png")),
                gaph,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("John Wick", style: kTitle),
                  Text("velvethue@gmail.com", style: kText),
                ])
              ]),
              MiniButton(
                text: "Logout",
                borderColor: Colors.red,
                onTap: () {
                  logout();
                },
              )
            ]),
            gap,
            gap,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CountView(count: "00", title: "In cart"),
                  CountView(count: "00", title: "In wishlist"),
                  CountView(count: "00", title: "Total Order"),
                ]),
            gap,
            gap,
            Container(
              width: double.infinity,
              height: 290.h,
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  boxShadow: const [kShadow],
                  borderRadius: BorderRadius.circular(10.r),
                  color: kWhite),
              child: Column(children: const [
                AccItem(icon: Icons.task_alt, text: "My order"),
                Divider(),
                AccItem(icon: Icons.favorite_outline, text: "My wishlist"),
                Divider(),
                AccItem(
                    icon: Icons.account_balance_wallet_outlined,
                    text: "My wallet"),
                Divider(),
                AccItem(icon: Icons.messenger_outline, text: "Messages"),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

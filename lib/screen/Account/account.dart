import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/services/firebase.dart';
import 'package:velvethue/services/firestore.dart';
import 'package:velvethue/widgets/acc_item.dart';
import 'package:velvethue/widgets/count_view.dart';
import 'package:velvethue/widgets/mini_button.dart';

import '../../../constant/text_style.dart';
import 'edit_acc.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthController());
    dynamic userData;

    return Scaffold(
      appBar: AppBar(
          title: Text("My Account", style: kTitle),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.follow_the_signs_outlined),
                onPressed: () => authController.signoutMethod()),
            IconButton(
                icon: const Icon(Icons.edit_square),
                onPressed: () {
                  Get.to(() => EditAccount(data: userData));
                })
          ]),
      body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return processing;
            } else if (snapshot.hasError) {
              return toast("please reload app if empty");
            } else {
              var data = snapshot.data!.docs[0];
              userData = data;
              return Padding(
                padding: kPadding.copyWith(top: 0),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            data['imageUrl'] == ''
                                ? CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage:
                                        const AssetImage("images/logo.png"))
                                : CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage:
                                        NetworkImage(data['imageUrl'])),
                            gaph,
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data['name'], style: kTitle),
                                  Text(data['email'], style: kText),
                                  //Text("bla bla bla", style: kTitle),
                                  //Text("velvethue@gmail.com", style: kText),
                                ])
                          ]),
                          MiniButton(
                            text: "Logout",
                            borderColor: Colors.red,
                            onTap: () {
                              authController.signoutMethod();
                            },
                          )
                        ]),
                    gap,
                    gap,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CountView(count: data['cartCount'], title: "In cart"),
                          CountView(
                              count: data['wishCount'], title: "In wishlist"),
                          CountView(
                              count: data['orderCount'], title: "Total Order"),
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
                        AccItem(
                            icon: Icons.favorite_outline, text: "My wishlist"),
                        Divider(),
                        AccItem(
                            icon: Icons.account_balance_wallet_outlined,
                            text: "My wallet"),
                        Divider(),
                        AccItem(
                            icon: Icons.messenger_outline, text: "Messages"),
                      ]),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}

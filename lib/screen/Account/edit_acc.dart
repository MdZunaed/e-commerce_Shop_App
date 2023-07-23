import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/controller/account_ctrl.dart';
import 'package:velvethue/widgets/button.dart';
import 'package:velvethue/widgets/text_field.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AccController());
    final nameController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kPadding,
        child: Center(
            child: Obx(
          () => Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: controller.imgPath.isEmpty
                    ? Image.asset("images/logo.png", fit: BoxFit.cover)
                    : Image.file(File(controller.imgPath.value),
                        fit: BoxFit.cover),
              ),
              space,
              OutlinedButton(
                  onPressed: () {
                    controller.changeImage();
                  },
                  child: Text("change image", style: kText)),
              gap,
              TxtField(controller: nameController, hint: "name"),
              gap,
              TxtField(controller: passController, hint: "password"),
              const Spacer(),
              CustomButton(text: "save changes", onTap: () {}),
            ],
          ),
        )),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/controller/account_ctrl.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/widgets/button.dart';
import 'package:velvethue/widgets/text_field.dart';

class EditAccount extends StatelessWidget {
  final dynamic data;

  const EditAccount({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AccController());

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
                child: data['imageUrl'] == '' && controller.imgPath.isEmpty
                    ? const Image(image: AssetImage('images/logo.png'))
                    //? Image.asset("images/logo.png", fit: BoxFit.cover)
                    : data['imageUrl'] != null && controller.imgPath.isEmpty
                        ? Image.network(data['imageUrl'], fit: BoxFit.cover)
                        : Image.file(File(controller.imgPath.value),
                            fit: BoxFit.cover),
              ),
              space,
              OutlinedButton(
                  onPressed: () {
                    controller.changeimage();
                  },
                  child: Text("change image", style: kText)),
              gap,
              TxtField(
                  controller: controller.nameController, hint: data['name']),
              gap,
              // TxtField(
              //     controller: controller.passController,
              //     hint: data['pass'],
              //     obscure: true),
              const Spacer(),
              controller.isLoading.value
                  ? processing
                  : CustomButton(
                      text: "save changes",
                      onTap: () async {
                        controller.isLoading(true);
                        if (controller.imgPath.value.isNotEmpty &&
                            controller.nameController.text.isNotEmpty) {
                          await controller.uploadImage();
                          await controller.updateInfo();
                          toast("Update Successfully");
                        } else {
                          toast("please select image and name both");
                          controller.isLoading(false);
                        }
                      }),
            ],
          ),
        )),
      ),
    );
  }
}

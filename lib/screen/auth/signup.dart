import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/screen/auth/login.dart';
import '../../constant/others.dart';
import '../../constant/text_style.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 15.w),
        child: SafeArea(
            child: Obx(
          () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Your Account",
                    style: kTitle.copyWith(fontSize: 25.sp)),
                gap,
                TxtField(
                  controller: controller.nameController,
                  hint: "name",
                ),
                gap,
                TxtField(
                  controller: controller.signupEmailController,
                  hint: "Email",
                ),
                gap,
                TxtField(
                  controller: controller.signupPassController,
                  hint: "Password",
                  obscure: true,
                ),
                gap,
                TxtField(
                  controller: controller.cpassController,
                  hint: "Re-type Password",
                  obscure: true,
                ),
                gap,
                gap,

//******************Signup Method******************//

                controller.isLoading.value
                    ? processing
                    : CustomButton(
                        text: "Create Acoount",
                        onTap: () {
                          controller.signupMethod();
                        }),
                gap,
                gap,
                Text("Have an Account?",
                    style: kTitle.copyWith(fontSize: 23.sp)),
                gap,
                SizedBox(
                    height: 42.h,
                    width: double.infinity,
                    child: OutlinedButton(
                        child: Text("Login Here", style: kAction),
                        onPressed: () {
                          Get.to(const LoginPage());
                        })),
              ]),
        )),
      ),
    );
  }
}

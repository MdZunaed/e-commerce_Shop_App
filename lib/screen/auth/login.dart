import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/screen/auth/signup.dart';
import 'package:velvethue/constant/others.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/widgets/button.dart';
import 'package:velvethue/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 120.h, horizontal: 15.w),
        child: SafeArea(
            child: Obx(
          () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login To Your Account",
                    style: kTitle.copyWith(fontSize: 25.sp)),
                gap,
                TxtField(
                    controller: controller.loginEmailController, hint: "Email"),
                gap,
                TxtField(
                  controller: controller.loginPassController,
                  hint: "Password",
                  obscure: true,
                ),
                gap,
                gap,

//******************Login Method******************//

                controller.isLoading.value
                    ? processing
                    : CustomButton(
                        text: "Login",
                        onTap: () {
                          controller.loginMethod();
                        }),
                gap,
                InkWell(
                    onTap: () => Get.defaultDialog(
                            title: "Not available",
                            content: Text(
                                "Relax and try to remember your password",
                                style: kText),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("OK", style: kTitle))
                            ]),
                    child: Text("Forget Password?", style: kText)),
                gap,
                gap,
                Text("Need an Account?",
                    style: kTitle.copyWith(fontSize: 23.sp)),
                gap,
                SizedBox(
                    height: 42.h,
                    width: double.infinity,
                    child: OutlinedButton(
                        child: Text("Register", style: kAction),
                        onPressed: () {
                          Get.to(() => const SignupPage());
                        })),
              ]),
        )),
      ),
    );
  }
}

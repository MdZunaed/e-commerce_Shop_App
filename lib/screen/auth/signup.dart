import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/screen/auth/login.dart';
import 'package:velvethue/screen/home_page.dart';
import '../../constant/others.dart';
import '../../constant/text_style.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController cpassController = TextEditingController();

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
                  controller: nameController,
                  hint: "name",
                ),
                gap,
                TxtField(
                  controller: emailController,
                  hint: "Email",
                ),
                gap,
                TxtField(
                  controller: passController,
                  hint: "Password",
                  obscure: true,
                ),
                gap,
                TxtField(
                  controller: cpassController,
                  hint: "Re-type Password",
                  obscure: true,
                ),
                gap,
                gap,
                controller.isLoading.value
                    ? processing
                    : CustomButton(
                        text: "Create Acoount",
                        onTap: () async {
                          controller.isLoading(true);
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          String pass = passController.text.trim();
                          String cpass = cpassController.text.trim();
                          if (name == "" || email == "" || pass == "") {
                            toast("Fill all the info");
                            controller.isLoading(false);
                          } else if (pass != cpass) {
                            toast("Password do not match");
                            controller.isLoading(false);
                          } else {
                            await controller.signupMethod(
                                email: email, password: pass);
                            await controller.storeData(
                                name: name, email: email, password: pass);
                            toast("logged in");
                            Get.offAll(() => const HomePage());
                            // try {
                            //   await controller
                            //       .signupMethod(email: email, password: pass)
                            //       .then((value) {
                            //     return controller.storeData(
                            //         name: name, email: email, password: pass);
                            //   }).then((value) {
                            //     toast("Logged in");
                            //     Get.offAll(() => const HomePage());
                            //   });
                            // } catch (e) {
                            //   //auth.signOut();
                            //   toast(e.toString());
                            //   controller.isLoading(false);
                            // }
                          }
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/text_style.dart';
import 'package:velvethue/screen/home_page.dart';
import 'package:velvethue/screen/welcome%20page/intro.dart';

import '../../services/firebase.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          Get.offAll(() =>
              (currentUser != null) ? const HomePage() : const IntroPage())
        });

    // Future.delayed(const Duration(seconds: 1), () {
    //   auth.authStateChanges().listen((User? user) {
    //     if (user == null) {
    //       Get.offAll(() => const IntroPage());
    //     } else {
    //       Get.offAll(() => const HomePage());
    //     }
    //   });
    //   // Get.offAll(() =>
    //   //     (currentUser != null) ? const HomePage() : const IntroPage())
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("VELVETHUE", style: kHeading.copyWith(fontSize: 40.sp)),
        ),
      ),
    );
  }
}

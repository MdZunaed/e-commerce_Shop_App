import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/font_style.dart';
import 'package:velvethue/constant/text_style.dart';
import 'screen/welcome page/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(370, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'VELVETHUE',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: kSecondary,
              scaffoldBackgroundColor: kWhite,
              fontFamily: regular,
              appBarTheme: AppBarTheme(
                  titleTextStyle: kTitle,
                  backgroundColor: kWhite,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: kPriamry))),
          home: const SplashScreen(),
        );
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/models/user_model.dart';
import 'package:velvethue/services/firebase.dart';
import 'package:velvethue/screen/home_page.dart';

import '../constant/text_style.dart';
import '../screen/auth/login.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final loginEmailController = TextEditingController();
  final loginPassController = TextEditingController();
  final nameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPassController = TextEditingController();
  final cpassController = TextEditingController();
  UserModel userModel = UserModel();

  Future<UserCredential?> loginMethod() async {
    UserCredential? userCredential;
    String email = loginEmailController.text.trim();
    String password = loginPassController.text.trim();
    isLoading.value = true;
    if (email == "" || password == "") {
      toast("Fill all the info");
      isLoading.value = false;
    } else {
      try {
        userCredential = await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          toast("logged in");
          return Get.offAll(() => const HomePage());
        });
      } on FirebaseAuthException catch (e) {
        toast(e.toString());
        isLoading.value = false;
      }
    }
    return userCredential;
  }

  Future<UserCredential?> signupMethod({email, password}) async {
    UserCredential? userCredential;

    String name = nameController.text.trim();
    String email = signupEmailController.text.trim();
    String password = signupPassController.text.trim();
    String cpassword = cpassController.text.trim();
    isLoading.value = true;
    if (name == "" || email == "" || password == "") {
      toast("Fill all the info");
      isLoading.value = false;
    } else if (password != cpassword) {
      toast("password do not match");
      isLoading.value = false;
    } else {
      try {
        userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //String uid = currentUser!.uid;
        String uid = userCredential.user!.uid;
        UserModel newUser = UserModel(
            id: uid, name: name, email: email, pass: password, imageUrl: '');
        userModel = newUser;
        await firestore.collection(users).doc(uid).set(newUser.toMap());
        toast("Account created");
        Get.offAll(() => const HomePage());
        // userCredential = await auth
        //     .createUserWithEmailAndPassword(email: email, password: password)
        //     .then((value) {
        //   return storeData();
        // }).then((value) {
        //   toast("Account created");
        //   return Get.offAll(() => const HomePage());
        // });
      } on FirebaseAuthException catch (e) {
        toast(e.toString());
        isLoading.value = false;
      }
    }
    return userCredential;
  }

  // storeData() async {
  //   try {
  //     if (currentUser != null) {
  //       String uid = currentUser!.uid;
  //       UserModel newUser = UserModel(
  //           id: uid,
  //           name: nameController.text.trim(),
  //           email: signupEmailController.text.trim(),
  //           pass: signupPassController.text.trim(),
  //           imageUrl: '');
  //       DocumentReference store = firestore.collection(users).doc(uid);
  //       await store.set(newUser.toMap());
  //     }
  //   } catch (e) {
  //     toast(e.toString());
  //   }
  // }

  signoutMethod() {
    try {
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
              await auth.signOut();
              Get.offAll(() => const LoginPage());
            },
            child: Text("ok", style: kTitle.copyWith(color: Colors.red))),
      );
    } catch (e) {
      toast(e.toString());
    }
  }
}

toast(title) {
  Get.snackbar(title!, "",
      backgroundColor: kBg,
      borderColor: kPriamry,
      borderWidth: 1,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h));
}

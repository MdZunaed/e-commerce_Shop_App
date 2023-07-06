import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/screen/auth/firebase.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<UserCredential?> loginMethod({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      toast(e.toString());
    }
    return userCredential;
  }

  Future<UserCredential?> signupMethod({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      toast(e.toString());
    }
    return userCredential;
  }

  storeData({name, email, password}) async {
    try {
      if (currentUser != null) {
        String uid = currentUser!.uid;
        final store = firestore.collection(users).doc(uid);
        await store.set({
          'id': uid,
          'name': name,
          'email': email,
          'password': password,
          'imageUrl': ''
        });
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  // storeData({name, email, password}) async {
  //   DocumentReference store = firestore.collection(users).doc(currentUser!.uid);
  //   store.set({
  //     'id': currentUser!.uid,
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'imageUrl': ''
  //   });
  // }

  signoutMethod() {
    try {
      auth.signOut();
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

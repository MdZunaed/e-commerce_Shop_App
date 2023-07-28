import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velvethue/controller/auth.dart';
import 'package:velvethue/services/firebase.dart';

class AccController extends GetxController {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  var imgPath = ''.obs;
  var imgUrl = '';
  var isLoading = false.obs;
  changeimage() async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 60);
      if (img == null) return;
      imgPath.value = img.path;
    } on PlatformException catch (e) {
      toast(e.toString());
    }
  }

  uploadImage() async {
    var filename = basename(imgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(imgPath.value));
    imgUrl = await ref.getDownloadURL();
  }

  updateInfo() async {
    String name = nameController.text.trim();
    String pass = passController.text.trim();
    String uid = currentUser!.uid;
    var store = firestore.collection(users).doc(uid);
    store.set({'name': name, 'pass': pass, 'imageUrl': imgUrl},
        SetOptions(merge: true));
    isLoading(false);
  }

  // updateInfo() async {
  //   String name = nameController.text.trim();
  //   String pass = passController.text.trim();
  //   String uid = currentUser!.uid;
  //   UserModel updateUser = UserModel(name: name, pass: pass, imageUrl: imgUrl);
  //   var store = firestore.collection(users).doc(uid);
  //   store.set(updateUser.toMap(), SetOptions(merge: true));
  //   isLoading(false);
  // }
}

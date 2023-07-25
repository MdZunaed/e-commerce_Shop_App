import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velvethue/controller/auth.dart';

class AccController extends GetxController {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  var imgPath = "".obs;
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
}

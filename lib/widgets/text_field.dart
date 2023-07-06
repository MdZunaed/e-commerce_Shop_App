import 'package:flutter/material.dart';

import '../constant/text_style.dart';

class TxtField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscure;
  final String hint;

  const TxtField(
      {super.key, this.controller, this.obscure = false, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: kText,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
        ));
  }
}

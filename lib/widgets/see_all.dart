import 'package:flutter/material.dart';
import 'package:velvethue/constant/colors.dart';
import 'package:velvethue/constant/text_style.dart';

class SeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SeeAll({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: kAction),
        TextButton(
            onPressed: onTap,
            child: Text("See All", style: kAction.copyWith(color: kSecondary)))
      ],
    );
  }
}

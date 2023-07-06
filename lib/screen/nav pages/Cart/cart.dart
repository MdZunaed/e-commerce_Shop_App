import 'package:flutter/material.dart';

import '../../../constant/text_style.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Cart Item"), centerTitle: true, actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ]),
      body: Center(child: Text("No Item found", style: kText)),
    );
  }
}

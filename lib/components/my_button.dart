import 'package:flutter/material.dart';
import 'package:myshoesapp/utils/utils.dart';

class MyButton extends StatelessWidget {
  final Color myColor = Colors.black;
  const MyButton({super.key, required Color myColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 70,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: myButtonDecoration(),
        child: const Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

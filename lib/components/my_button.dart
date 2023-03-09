import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color myColor = const Color.fromRGBO(242, 102, 62, 1);
  final String buttonName = 'Sign In';
  Function()? onPressedFunction = () {};
  MyButton(
      {super.key,
      required Color myColor,
      required String buttonName,
      required Function()? onPressedFunction,
      TextInputType? textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: InkWell(
        onTap: onPressedFunction,
        child: Container(
          height: 70,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: myColor,
            // color: myColor,
          ),
          child: Text(
            buttonName,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

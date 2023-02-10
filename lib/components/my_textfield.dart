import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String myLabelText;
  final bool isObscureText;

  const MyTextField(
      {super.key,
      required this.myController,
      required this.myLabelText,
      required this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        // textAlign: TextAlign.center,
        controller: myController,
        obscureText: isObscureText,
        // obscuringCharacter: '*',
        cursorColor: Colors.white70,
        cursorRadius: const Radius.circular(10),
        // cursorHeight: 30,
        decoration: InputDecoration(
          labelText: myLabelText,
          labelStyle: const TextStyle(color: Colors.white70),
          // floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade500)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.white)),
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}

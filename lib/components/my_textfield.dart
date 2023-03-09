import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final bool isObscureText;
  String? myLabelText;
  String? myHintText;
  TextInputType myTextInputType;
  bool? wantEnabledBorder;
  bool? wantFocusedBorder;
  String? Function(String?)? myValidatorFunction;
  double? hintTextletterSpacing;
  double? inputTextletterSpacing;
  double? inputTextSize;
  int? maxInputLength;

  MyTextField(
      {super.key,
      required this.myController,
      required this.isObscureText,
      this.myHintText,
      this.myLabelText,
      this.myTextInputType = TextInputType.emailAddress,
      this.wantEnabledBorder,
      this.wantFocusedBorder,
      this.myValidatorFunction,
      this.hintTextletterSpacing,
      this.inputTextletterSpacing,
      this.inputTextSize,
      this.maxInputLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: myValidatorFunction,
      keyboardType: myTextInputType,
      style: TextStyle(
        color: Colors.white,
        fontSize: inputTextSize,
        fontWeight: FontWeight.w400,
        letterSpacing: inputTextletterSpacing,
      ),
      // textAlign: TextAlign.center,
      controller: myController,
      obscureText: isObscureText,
      // obscuringCharacter: '*',
      cursorColor: Colors.white70,
      cursorRadius: const Radius.circular(10),
      maxLength: maxInputLength,
      // cursorHeight: 30,
      decoration: InputDecoration(
          counterText: "",
          hintText: myHintText,
          hintStyle: TextStyle(
              color: Colors.white70, letterSpacing: hintTextletterSpacing),
          labelText: myLabelText,
          labelStyle: const TextStyle(color: Colors.white70),
          // floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: wantEnabledBorder == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey.shade500))
              : InputBorder.none,
          focusedBorder: wantFocusedBorder == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.white))
              : InputBorder.none,
          fillColor: Colors.grey.shade200,
          // errorBorder: InputBorder.none,
          errorStyle: const TextStyle(
              color: Color.fromRGBO(242, 102, 62, 1),
              fontSize: 10,
              fontWeight: FontWeight.w500)),
    );
  }
}

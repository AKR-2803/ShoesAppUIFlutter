import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshoesapp/auth_service.dart';
import 'package:myshoesapp/components/my_button.dart';
import '../components/my_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

// import 'home_page.dart';
// import 'package:myshoesapp/phone_getter_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color myOrange = const Color.fromRGBO(242, 102, 62, 1);
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 35, 30, 25),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: SizedBox(
                  height: 260,
                  width: 200,
                  // alignment: Alignment.center,
                  child: Stack(
                    // alignment: ,
                    children: [
                      Transform.rotate(
                        angle: -math.pi / 15,
                        child: Image.asset(
                          "assets/images/nikeshoelogo.png",
                          opacity: const AlwaysStoppedAnimation(0.2),
                          height: 240,
                        ),
                      ),
                      Transform.rotate(
                        angle: -math.pi / 30,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 92, left: 42),
                          child: SizedBox(
                              height: 90,
                              child:
                                  SvgPicture.asset('assets/images/nike-4.svg')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Text(
                "Welcome back! You've been missed",
                style: TextStyle(color: myOrange, fontSize: 18),
              ),
              const SizedBox(
                height: 25,
              ),

              //textfields

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    MyTextField(
                      myController: usernameController,
                      myLabelText: 'Username',
                      isObscureText: false,
                      wantEnabledBorder: true,
                      wantFocusedBorder: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      myController: passwordController,
                      myLabelText: 'Password',
                      isObscureText: true,
                      wantEnabledBorder: true,
                      wantFocusedBorder: true,
                    ),
                  ],
                ),
              ),

              //forgotpassword
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black87)),
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white70,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //signin btn
              MyButton(
                myColor: myOrange,
                buttonName: 'Sign In',
                onPressedFunction: () {},
              ),

              const SizedBox(
                height: 60,
              ),
              //or continue with use two dividers
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const Text(
                    "Or continue with",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //google button
                  GestureDetector(
                    onTap: () async {
                      await AuthService().signInWithGoogle();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: myOrange,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Authenticating",
                                    style: TextStyle(
                                      backgroundColor: Colors.transparent,
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ]),
                          );
                        },
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        if (mounted) {
                          return Navigator.pushNamedAndRemoveUntil(
                              context, 'home', (route) => false);
                        }
                      });
                    },
                    child: Container(
                        height: 75,
                        width: 75,
                        // padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade800),
                        child: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 35,
                          color: Colors.white70,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "phone");
                    },
                    child: Container(
                        height: 75,
                        width: 75,
                        // padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade800),
                        child: const FaIcon(
                          FontAwesomeIcons.phone,
                          size: 50,
                          color: Colors.white70,
                        )),
                  )
                ],
              ),

              //not a member? Register Now(use textbutton)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myshoesapp/auth_service.dart';
import 'package:myshoesapp/components/my_button.dart';
import '../components/my_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Colors myOrange = Color.fromRGBO(242, 102, 62, 1),;
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

              const Text(
                "Welcome back! You've been missed",
                style: TextStyle(
                    color: Color.fromRGBO(242, 102, 62, 1), fontSize: 18),
              ),
              const SizedBox(
                height: 25,
              ),

              //textfields

              MyTextField(
                myController: usernameController,
                myLabelText: 'Username',
                isObscureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

              MyTextField(
                myController: passwordController,
                myLabelText: 'Password',
                isObscureText: true,
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
              const MyButton(
                myColor: Color.fromRGBO(242, 102, 62, 1),
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                      });
                      AuthService().signInWithGoogle();
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
                  Container(
                      height: 75,
                      width: 75,
                      // padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade800),
                      child: const FaIcon(
                        FontAwesomeIcons.twitter,
                        size: 50,
                        color: Colors.white70,
                      ))
                ],
              ),

              //sign in using google or apple logos

              //not a member? Register Now(use textbutton)
            ],
          ),
        ),
      ),
    );
  }
}

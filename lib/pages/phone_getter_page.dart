//Changes to be made: null check error issue

// import 'package:flutter/material.dart';
// import 'package:myshoesapp/components/my_textfield.dart';
// // import 'package:myshoesapp/phone_otp.dart';

// class PhoneGetterPage extends StatefulWidget {
//   const PhoneGetterPage({Key? key}) : super(key: key);
//   static String verify = "";
//   @override
//   State<PhoneGetterPage> createState() => _PhoneGetterPageState();
// }

// class _PhoneGetterPageState extends State<PhoneGetterPage> {
//   TextEditingController phoneNumberController = TextEditingController();
//   bool isValidNumber = false;
//   // final _formKey = GlobalKey<FormState>();
//   var countryCode = '+91';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       backgroundColor: const Color.fromARGB(225, 35, 30, 25),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/phonegetterpage.png',
//                 width: 300,
//                 height: 250,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Enter your phone number and press 'Send OTP'",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w300,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 65,
//                     width: 65,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(width: 0.75, color: Colors.white70),
//                     ),
//                     child: Text(
//                       "+91",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: MyTextField(
//                       // myValidatorFunction: (value) {
//                       //   if (value!.length != 10) {
//                       //     return 'Enter a valid number';
//                       //   }
//                       // },
//                       maxInputLength: 10,
//                       myController: phoneNumberController,
//                       inputTextletterSpacing: 6,
//                       hintTextletterSpacing: 0,
//                       inputTextSize: 20,
//                       // myLabelText: 'Enter Phone Number',
//                       isObscureText: false,
//                       myTextInputType: TextInputType.number,
//                       myHintText: 'Phone Number',
//                       wantEnabledBorder: true,
//                       wantFocusedBorder: true,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (phoneNumberController.text.length != 10) {
//                     return showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text("Invalid Number, Try again"),
//                             actions: [
//                               ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text("OK"))
//                             ],
//                           );
//                         });
//                   }
//                   Navigator.pushNamed(context, '/otp');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 70),
//                   primary: isValidNumber == false
//                       ? const Color.fromRGBO(242, 102, 62, 1).withOpacity(0.5)
//                       : const Color.fromRGBO(242, 102, 62, 1),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 child: const Text(
//                   "Send OTP",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w900),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

//                 // Row(
//                 //   crossAxisAlignment: CrossAxisAlignment.center,
//                 //   children: [
//                 //     SizedBox(
//                 //       width: 10,
//                 //     ),
//                 //     Container(
//                 //       height: 65,
//                 //       width: double.infinity,
//                 //       decoration: BoxDecoration(
//                 //         border: Border.all(width: 1, color: Colors.white70),
//                 //         borderRadius: BorderRadius.circular(8),
//                 //       ),
//                 //       child: Text(
//                 //         "+91",
//                 //         style: TextStyle(
//                 //             color: Colors.white,
//                 //             fontWeight: FontWeight.w500,
//                 //             fontSize: 15),
//                 //       ),
//                 //     ),
//                 //     const SizedBox(
//                 //       height: 20,
//                 //       child: Text(
//                 //         "+91",
//                 //         style: TextStyle(
//                 //             color: Colors.white,
//                 //             fontWeight: FontWeight.w500,
//                 //             fontSize: 15),
//                 //       ),
//                 //     ),
//                 //     const SizedBox(
//                 //       width: 10,
//                 //     ),
//                 //     Expanded(
//                 //       child: MyTextField(
//                 //         myValidatorFunction: (value) {
//                 //           if (value!.length != 10) {
//                 //             return 'Enter a valid number';
//                 //           }
//                 //         },
//                 //         myController: phoneNumberController,
//                 //         // myLabelText: 'Enter Phone Number',
//                 //         isObscureText: false,
//                 //         myTextInputType: TextInputType.number,
//                 //         myHintText: 'Phone Number',
//                 //         wantEnabledBorder: false,
//                 //         wantFocusedBorder: false,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
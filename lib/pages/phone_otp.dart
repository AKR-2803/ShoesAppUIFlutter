//Changes to be made: null check error issue

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:myshoesapp/pages/phone_getter_page.dart';
// import 'package:pinput/pinput.dart';
// // import 'package:myshoesapp/pages/home_page.dart';

// class PhoneOTP extends StatefulWidget {
//   PhoneOTP({Key? key}) : super(key: key);

//   @override
//   State<PhoneOTP> createState() => _PhoneOTPState();
// }

// class _PhoneOTPState extends State<PhoneOTP> {
//   TextEditingController phoneNumberController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   var countryCode = '+91';
//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: const TextStyle(
//         fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
//     decoration: BoxDecoration(
//       border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );
//   var otp = "";

//   // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_rounded),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(225, 35, 30, 25),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/phonegetterpage.png',
//                     width: 300, height: 250),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Phone Verification",
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Enter the OTP sent to your number.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.white),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Pinput(
//                   defaultPinTheme: defaultPinTheme,
//                   // focusedPinTheme: focusedPinTheme,
//                   // submittedPinTheme: submittedPinTheme,
//                   // validator: (s) {
//                   //   return s == '2222' ? null : 'Pin is incorrect';
//                   // },
//                   length: 6,
//                   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                   showCursor: true,
//                   onCompleted: (pin) => print(pin),
//                   onChanged: (value) {
//                     otp = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       PhoneAuthCredential credential =
//                           PhoneAuthProvider.credential(
//                               verificationId: PhoneGetterPage.verify,
//                               smsCode: otp);
//                       // Sign the user in (or link) with the credential
//                       await _auth.signInWithCredential(credential);
//                       Navigator.pushNamedAndRemoveUntil(
//                           context, 'home', (route) => false);
//                     } catch (e) {
//                       print("Error occured: " + e.toString());
//                     }
//                   },
//                   // onPressed: () async {
//                   //   await FirebaseAuth.instance.verifyPhoneNumber(
//                   //     phoneNumber: countryCode + phoneNumberController.text,
//                   //     verificationCompleted:
//                   //         (PhoneAuthCredential credential) async {
//                   //       await FirebaseAuth.instance
//                   //           .signInWithCredential(credential);
//                   //     },
//                   //     verificationFailed: (FirebaseAuthException e) {
//                   //       if (e.code == 'invalid-phone-number') {
//                   //         print('The provided phone number is not valid.');
//                   //       }
//                   //     },
//                   //     codeSent:
//                   //         (String verificationId, int? resendToken) async {
//                   //       String smsCode = otp;

//                   //       // Create a PhoneAuthCredential with the code
//                   //       PhoneAuthCredential credential =
//                   //           PhoneAuthProvider.credential(
//                   //               verificationId: verificationId,
//                   //               smsCode: smsCode);

//                   //       // Sign the user in (or link) with the credential
//                   //       await FirebaseAuth.instance
//                   //           .signInWithCredential(credential);
//                   //       PhoneGetterPage.verify = verificationId;
//                   //       Navigator.pushNamed(context, "/home");
//                   //     },
//                   //     codeAutoRetrievalTimeout: (String verificationId) {},
//                   //   );
//                   // },

//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(double.infinity, 70),
//                     primary: const Color.fromRGBO(242, 102, 62, 1),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                   child: Text(
//                     "Submit",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w900),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         // Navigator.pop(context);
//                       },
//                       style: ButtonStyle(
//                         overlayColor: MaterialStateProperty.all(Colors.white30),
//                       ),
//                       child: Text(
//                         "Edit Phone number?",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:myshoesapp/auth_service.dart';
// // import 'package:firebase_core/firebase_core.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData(fontFamily: 'Questrial'),
// //       themeMode: ThemeMode.system,
// //       debugShowCheckedModeBanner: false,
// //       home: AuthService().handleAuthState(),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myshoesapp/pages/home_page.dart';
import 'package:myshoesapp/pages/login_page.dart';

class AuthService {
  GoogleSignIn googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  var verificationId = '';

  //1. handleAuthState()
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
            // Navigator.pushAndRemoveUntil(context, "home", (route) => false);
          } else {
            return LoginPage();
          }
        });
  }

  // signInWithGoogle()
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // signOut()
  Future<void> signOutWithGoogle() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    // Navigator.pop(context);
    // return LoginPage();
  }

  //phone authentication
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print("The provided phone number is not valid.");
          } else {
            print("Something went wrong! Try Again.");
          }
        },
        codeSent: (String verificationId, int? resendTOken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));
    return credential.user != null ? true : false;
  }
}

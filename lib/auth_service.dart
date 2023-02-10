import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myshoesapp/pages/home_page.dart';
import 'package:myshoesapp/pages/login_page.dart';

class AuthService {
  GoogleSignIn googleSignIn = GoogleSignIn();

  //1. handleAuthState()
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
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
}

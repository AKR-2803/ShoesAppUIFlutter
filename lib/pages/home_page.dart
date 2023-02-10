import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myshoesapp/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome To Home",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.displayName!,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email!,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(242, 102, 62, 1)),
              onPressed: () {
                AuthService().signOutWithGoogle();
              },
              child: const Text("Sign Out")),
        ],
      ),
    );
  }
}

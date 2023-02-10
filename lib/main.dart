//Thi is 

import 'package:flutter/material.dart';
import 'package:myshoesapp/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuthState(),
    );
  }
}


























// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:myshoesapp/widget/home_page.dart';
// import 'package:myshoesapp/widget/login_widget.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(home: MainPage()));
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               print(snapshot.toString());
//               return HomePage();
//             } else if (!snapshot.hasData) {
//               print("............data: ${snapshot.data}");
//               return CircularProgressIndicator();
//             } else {
//               print(snapshot.toString());
//               return LoginWidget();
//             }
//           }),
//     );
//   }
// }

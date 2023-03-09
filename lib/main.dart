import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myshoesapp/auth_service.dart';
import 'package:myshoesapp/pages/home_page.dart';
import 'package:myshoesapp/pages/login_page.dart';
import 'package:myshoesapp/pages/phone_getter_page.dart';
import 'package:myshoesapp/pages/phone_otp.dart';
import 'package:provider/provider.dart';
import 'package:myshoesapp/providers/counter_provider.dart';
// import 'package:myshoesapp/ui_helper/helper_functions.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:myshoesapp/widgets/drawer.dart';
// import 'package:myshoesapp/widgets/GridViewShoes.dart';
// import 'package:myshoesapp/widgets/MiddleListView.dart';
// import 'package:myshoesapp/widgets/MyCustomBottomAppBar.dart';
// import 'package:myshoesapp/widgets/MyCustomFloatingActionButton.dart';
// import 'package:myshoesapp/widgets/UpperContainer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counter())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Questrial'),
      // initialRoute: _auth.currentUser == null ? '/login' : '/home',
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   '/home': (context) => HomePage(),
      //   // '/phone': (context) => PhoneGetterPage(),
      //   // '/otp': (context) => PhoneOTP(),
      // },
      // home: AuthService().handleAuthState(),
      home: HomePage(),
    );
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DraggableScrollableSheet'),
//       ),
//       body: SizedBox.expand(
//         child: DraggableScrollableSheet(
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Container(
//               color: Colors.blue[100],
//               child: ListView.builder(
//                 controller: scrollController,
//                 itemCount: 25,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(title: Text('Item $index'));
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

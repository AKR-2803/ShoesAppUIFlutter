import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshoesapp/auth_service.dart';
import 'package:myshoesapp/ui_helper/helper_functions.dart';

List<IconData> iconList = [
  Icons.home,
  Icons.explore,
  Icons.theater_comedy,
  Icons.bookmark,
  Icons.topic_rounded,
  Icons.contact_phone_rounded
];
List<String> iconNames = [
  "Home",
  "Explore",
  "Theme",
  "Bookmarks",
  "Topics",
  "Contact Us"
];

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(38, 35, 33, 1),
                Color.fromRGBO(242, 102, 62, 1),
              ],
              // begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              /*
	                      About stops :  The stops list, if specified, must have the same length as colors.
                            It specifies fractions of the vector from start to end, between 0.0 and 1.0, for each color. 
	                      If it is null, a uniform distribution is assumed.
                      */
              stops: [0.85, 0.2]),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange[500],
              ),

              //current logged in userName
              accountName:
                  Text(FirebaseAuth.instance.currentUser!.displayName!),
              //current logged in userEmail
              accountEmail: Text(FirebaseAuth.instance.currentUser!.email!),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepOrange[900]),
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL!),
                ),
              ),
            ),
            for (int i = 0; i < 6; i++)
              ListTile(
                leading: Icon(
                  iconList[i],
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  iconNames[i],
                  style: HelperFunctions().weight500size15(),
                ),
              ),
            // ListTile(
            //   leading: Icon(
            //     Icons.explore,
            //     color: Colors.white,
            //     size: 25,
            //   ),
            //   title: Text(
            //     "Explore",
            //     style: HelperFunctions().weight500size15(),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.theater_comedy,
            //     color: Colors.white,
            //     size: 25,
            //   ),
            //   title: Text(
            //     "Theme",
            //     style: HelperFunctions().weight500size15(),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.bookmark_border_rounded,
            //     color: Colors.white,
            //     size: 25,
            //   ),
            //   title: Text(
            //     "Bookmarks",
            //     style: HelperFunctions().weight500size15(),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.topic_rounded,
            //     color: Colors.white,
            //     size: 25,
            //   ),
            //   title: Text(
            //     "Topics",
            //     style: HelperFunctions().weight500size15(),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.contact_phone_rounded,
            //     color: Colors.white,
            //     size: 25,
            //   ),
            //   title: Text(
            //     "Contact Us",
            //     style: HelperFunctions().weight500size15(),
            //   ),
            // ),
            SizedBox(
              height: 130,
            ),
            SizedBox(
              width: 30,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(242, 102, 62, 1),
                  minimumSize: Size(40, 70),
                ),
                onPressed: () {
                  AuthService().signOutWithGoogle();
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LogOut",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

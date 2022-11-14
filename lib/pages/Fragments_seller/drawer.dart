import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/Fragments_buyer/home_page.dart';
import 'package:earner_app/pages/Fragments_seller/aboutus.dart';
import 'package:earner_app/pages/Fragments_seller/feedback.dart';
import 'package:earner_app/pages/Fragments_seller/home_page.dart';
import 'package:earner_app/pages/Fragments_seller/login_page.dart';
import 'package:earner_app/pages/Fragments_seller/profileSeller.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Map<String, dynamic>? paymentIntent;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.cyan,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                margin: EdgeInsets.all(0),
                accountName:
                    Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        )),
                accountEmail: Text("${loggedInUser.email}",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    )),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("${loggedInUser.img}"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashBoardseller(),
                    ),
                  );
                },
                child: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_crop_circle,
                color: Colors.white,
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSeller(),
                    ),
                  );
                },
                child: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(indent: 15, endIndent: 15),
            ListTile(
              leading: Icon(
                CupertinoIcons.f_cursive_circle_fill,
                color: Colors.white,
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedBack(),
                    ),
                  );
                },
                child: Text(
                  "FeedBack",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: Icon(
                CupertinoIcons.app_badge,
                color: Colors.white,
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
                child: Text(
                  "About Us",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            SizedBox(
              height: 220,
            ),
            ListTile(
              // leading: const Icon(
              //   CupertinoIcons.archivebox_fill,
              //   color: Colors.red,
              // ),
              title: Container(
                color: Colors.blueGrey,
                child: MaterialButton(
                  onPressed: () {
                    logout(context);
                  },
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    "Logout",

                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        //backgroundColor: Colors.redAccent,
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPageseller()));
  }
}

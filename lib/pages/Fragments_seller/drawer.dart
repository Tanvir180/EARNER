import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/Fragments_seller/registration_page.dart';
import 'package:earner_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class MyDrawerseller extends StatefulWidget {
  const MyDrawerseller({Key? key}) : super(key: key);

  @override
  State<MyDrawerseller> createState() => _MyDrawersellerState();
}

class _MyDrawersellerState extends State<MyDrawerseller> {
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
                  backgroundImage: AssetImage("assets/app.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            ListTile(
              // Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: <Widget>[
              //               const Text("Don't have an account? "),

              //                 child: const Text(
              //                   "SignUp",
              //                   style: TextStyle(
              //                       color: Colors.redAccent,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 18),
              //                 ),
              //               )
              //             ])

              leading: Icon(
                CupertinoIcons.info_circle_fill,
                color: Colors.white,
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPageseller(),
                    ),
                  );
                },
                child: Text(
                  "Add Info",
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
                CupertinoIcons.f_cursive_circle,
                color: Colors.white,
              ),
              title: Text(
                "Feedback",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: Icon(
                CupertinoIcons.app_badge,
                color: Colors.white,
              ),
              title: Text(
                "About Us",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(indent: 16, endIndent: 16),
            SizedBox(
              height: 170,
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
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}

import 'dart:async';

import 'package:earner_app/auth/on_bording_screen.dart';
import 'package:earner_app/pages/select_user.dart';
import 'package:flutter/material.dart';

//import 'package:jobsearch/Screens/DashBoard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SelectUser()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/app2.png',
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}

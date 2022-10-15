import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/auth/splash_screen.dart';
import 'package:earner_app/model/user.dart';
import 'package:earner_app/pages/login_page.dart';
import 'package:earner_app/pages/select_user.dart';
import 'package:earner_app/widgets/payment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51Lg8ZaEwHQ1skIbyFSluAQEJ9UJBOBVmQF7PIIATCDo2WuWXNOMteKZqifC4typBMOEc6kKFSnDTcYodTjvNpuel00hHRyOFim";

  await Stripe.instance.applySettings();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EARNER',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SplashScreen(),
    );
  }
}

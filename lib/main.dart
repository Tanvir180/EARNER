import 'package:earner_app/auth/splash_screen.dart';
import 'package:earner_app/pages/Fragments_seller/JobsScreen.dart';
import 'package:earner_app/widgets/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:localnotificationflutter/mainscreen.dart';
// import 'package:localnotificationflutter/notificationservice.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
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

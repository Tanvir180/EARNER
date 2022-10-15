import 'package:earner_app/pages/Fragments_seller/login_page.dart';
import 'package:earner_app/pages/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
//  BUYER

    final buyerButton = Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          // signIn(emailController.text, passwordController.text);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: const Text(
          "BUYER",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

//  SELLER

    final sellerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          // signIn(emailController.text, passwordController.text);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPageseller(),
            ),
          );
        },
        child: const Text(
          "SELLER",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 226, 226, 226),
      // appBar: GradientAppBar(
      //   title: const Text('EARNER'),
      //   backgroundColorStart: Colors.blueGrey,
      //   backgroundColorEnd: Colors.cyanAccent,
      // ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(142, 250, 114, 250),
              Color.fromARGB(255, 110, 162, 251),
              Colors.blueGrey
            ])),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              //color: Color.fromARGB(255, 228, 228, 228),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                        child: Image.asset(
                          "assets/app2.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 25),
                      buyerButton,
                      const SizedBox(height: 35),
                      sellerButton,
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("Welcome To EARNER APP"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

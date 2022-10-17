import 'package:cached_network_image/cached_network_image.dart';
import 'package:earner_app/Services/global_variables.dart';
import 'package:earner_app/pages/Fragments_seller/login_page.dart';
import 'package:earner_app/pages/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: loginUrlImage,
            placeholder: ((context, url) => Image.asset(
                  'assets/images/wallpaper.jpg',
                  fit: BoxFit.fill,
                )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          )
        ],
      ),
    );
  }
}

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> with TickerProviderStateMixin {
  // form key
  final _formKey = GlobalKey<FormState>();
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

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
      // body: Container(
      //   decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           colors: [
      //         Color.fromARGB(142, 250, 114, 250),
      //         Color.fromARGB(255, 110, 162, 251),
      //         Colors.blueGrey
      //       ])),

      body: Container(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: loginUrlImage,
              // placeholder: ((context, url) => Image.asset(
              //       'assets/Images/wallpaper.jpg',
              //       fit: BoxFit.fill,
              //     )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: FractionalOffset(_animation.value, 0),
            ),
            Center(
              child: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}

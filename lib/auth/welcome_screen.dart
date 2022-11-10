import 'package:cached_network_image/cached_network_image.dart';
import 'package:earner_app/Services/global_variables.dart';
import 'package:earner_app/pages/select_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen>
    with TickerProviderStateMixin {
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
        AnimationController(vsync: this, duration: Duration(seconds: 30));
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
    return Scaffold(
      body: Stack(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 180,
                  child: Image.asset(
                    "assets/app2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 30),
                    child: Column(
                      children: [
                        Text(
                          'EARNER APP',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.white10,
                                  offset: Offset(3, 3),
                                )
                              ]),
                        ),
                        Text(
                          ' This is an online platform where you can Find Your Desire Job!',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              shadows: [
                                // BoxShadow(
                                //   blurRadius: 5,
                                //   color: Colors.black,
                                //   offset: Offset(2, 2),
                                // )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      // ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 8, left: 44, right: 44, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectUser()));
                          },
                          child: Text(
                            'Get Start',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 80,
                      //   width: double.infinity,
                      //   padding:
                      //       const EdgeInsets.only(top: 8, left: 44, right: 44),
                      //   child: RaisedButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => loginscreenstaff()));
                      //     },
                      //     elevation: 0,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(35),
                      //     ),
                      //     color: Colors.orange,
                      //     child: Text(
                      //       'Staff',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

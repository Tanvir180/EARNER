import 'package:cached_network_image/cached_network_image.dart';
import 'package:earner_app/Services/global_variables.dart';
import 'package:earner_app/pages/Fragments_seller/drawer.dart';
import 'package:earner_app/pages/Fragments_seller/login_page.dart';

import 'package:earner_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

//import 'package:gradient_app_bar/gradient_app_bar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with TickerProviderStateMixin {
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
        appBar: AppBar(
          title: const Text(
            "EARNER",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/Images/profile.png"),
              ),
            ),
          ],
        ),
        drawer: const Drawer(
          child: MyDrawer(),
        ),
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: aboutusImage,
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
              child: Container(
                margin: EdgeInsets.all(15),
                child: RichText(
                  text: const TextSpan(
                    text: 'About Our App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: brown),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '\n  \n Unemployment is the biggest problem in Bangladesh now a days. So, the the remote job can solve this problem because during COVID 19 people are familiar with the term work from home. It is efficient and cost effective.Remote job is the future but in Bangladesh there are not any particular app or website for this.\n \n There are multiple international apps like fiverr or upwork but they cut a huge amount of amount and payment procedure is not so friendly for us. So, We mainly focus on the freelancer and unemployed persons who have been well qualified and the company or the client give post for the work. Anyone who is eligible can apply and the buyer will admit him for the specific work.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: black)),
                      TextSpan(text: "\n \n \n © Earner App 2022"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

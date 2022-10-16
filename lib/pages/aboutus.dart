import 'package:cached_network_image/cached_network_image.dart';
import 'package:earner_app/Services/global_variables.dart';
import 'package:earner_app/pages/Fragments_seller/login_page.dart';
import 'package:earner_app/pages/login_page.dart';
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
    return Container(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: aboutusImage,
            placeholder: ((context, url) => Image.asset(
                  'assets/Images/wallpaper.jpg',
                  fit: BoxFit.fill,
                )),
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
                child: Text(
                  "Unemployment is the biggest problem in Bangladesh now a days. So, the remote job can solve this pr",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    backgroundColor: white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:earner_app/Services/global_variables.dart';
import 'package:earner_app/pages/Fragments_seller/drawer.dart';
import 'package:earner_app/pages/Fragments_seller/home_page.dart';
import 'package:earner_app/widgets/drawer.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> with TickerProviderStateMixin {


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




  TextEditingController _feedbackEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();
  TextEditingController _salaryEditingController = TextEditingController();
  TextEditingController _imageEditingController = TextEditingController();
  TextEditingController _workingPeriodEditingController =
      TextEditingController();
  // List<String> gender = ["Male", "Female", "Other"];

  // Future<void> _selectDateFromPicker(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime(DateTime.now().year - 20),
  //     firstDate: DateTime(DateTime.now().year - 30),
  //     lastDate: DateTime(DateTime.now().year),
  //   );
  //   if (picked != null)
  //     setState(() {
  //       _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
  //     });
  // }

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("feedback");
    return _collectionRef
        .doc() //currentUser!.email
        .set({
          "feedback": _feedbackEditingController.text,
          // "description": _descriptionEditingController.text,
          // "salary": _salaryEditingController.text,
          // "workingPeriod": _imageEditingController.text,
          // "experience": _workingPeriodEditingController.text,
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (_) => DashBoardseller())))
        .catchError((error) => print("something is wrong. $error"));
  }

  // final _auth = FirebaseAuth.instance;

  // // string for displaying the error Message
  // String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // // editing Controller
  // final jobNameEditingController = new TextEditingController();
  // final descriptionEditingController = new TextEditingController();
  // final salaryEditingController = new TextEditingController();
  // final imageEditingController = new TextEditingController();
  // final workingPeriodEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    final textfield = Text("Feedback: ");
    //first name field
    final feedbackField = TextFormField(
        autofocus: false,
        controller: _feedbackEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          _feedbackEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Give FeedBack",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final postButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            sendUserDataToDB();
          },
          child: const Text(
            "POST",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

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
        body: Stack(children: [
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

          // backgroundColor: Colors.white,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: IconButton(
          //     icon: const Icon(Icons.arrow_back, color: Colors.red),
          //     onPressed: () {
          //       // passing this to our root
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            height: 150,
                            child: Image.asset(
                              "assets/app2.png",
                              fit: BoxFit.contain,
                            )),
                        const SizedBox(height: 45),
                        textfield,
                        const SizedBox(height: 45),
                        feedbackField,
                        const SizedBox(height: 45),
                        postButton,
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}

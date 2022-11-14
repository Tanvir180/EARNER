import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/Fragments_buyer/home_page.dart';
import 'package:earner_app/pages/Fragments_seller/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddWorkPageseller extends StatefulWidget {
  const AddWorkPageseller({Key? key}) : super(key: key);

  @override
  State<AddWorkPageseller> createState() => _AddWorkPagesellerState();
}

class _AddWorkPagesellerState extends State<AddWorkPageseller> {
  TextEditingController _jobNameEditingController = TextEditingController();
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
        FirebaseFirestore.instance.collection("jobs");
    return _collectionRef
        .doc() //currentUser!.email
        .set({
          "type": _jobNameEditingController.text,
          "description": _descriptionEditingController.text,
          "salary": _salaryEditingController.text,
          "workingPeriod": _imageEditingController.text,
          "experience": _workingPeriodEditingController.text,
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
    //first name field
    final jobNameField = TextFormField(
        autofocus: false,
        controller: _jobNameEditingController,
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
          _jobNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Job Requiement",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final descriptionField = TextFormField(
        autofocus: false,
        controller: _descriptionEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Description cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          _descriptionEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final salaryField = TextFormField(
        autofocus: false,
        controller: _salaryEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          _salaryEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Salary",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final imageField = TextFormField(
        autofocus: false,
        controller: _imageEditingController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          _imageEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.timelapse),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Working Experience",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final workingPeriodField = TextFormField(
        autofocus: false,
        controller: _workingPeriodEditingController,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          return null;
        },
        onSaved: (value) {
          _workingPeriodEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.work_history_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Working Period",
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
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
                    jobNameField,
                    const SizedBox(height: 20),
                    descriptionField,
                    const SizedBox(height: 20),
                    salaryField,
                    const SizedBox(height: 20),
                    workingPeriodField,
                    const SizedBox(height: 20),
                    imageField,
                    const SizedBox(height: 20),
                    postButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//   void signUp(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth
//             .createUserWithEmailAndPassword(email: email, password: password)
//             .then((value) => {postDetailsToFirestore()})
//             .catchError((e) {
//           Fluttertoast.showToast(msg: e!.message);
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }

//   postDetailsToFirestore() async {
//     // calling our firestore
//     // calling our user model
//     // sedning these values

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     UserModel userModel = UserModel();

//     // writing all the values
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.firstName = firstNameEditingController.text;
//     userModel.secondName = secondNameEditingController.text;

//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Account created successfully :) ");

//     Navigator.pushAndRemoveUntil((context),
//         MaterialPageRoute(builder: (context) => DashBoard()), (route) => false);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/Fragments_seller/feedbacksee.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileSeller extends StatefulWidget {
  const ProfileSeller({super.key});

  @override
  State<ProfileSeller> createState() => _ProfileSellerState();
}

class _ProfileSellerState extends State<ProfileSeller> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  // text fields' controllers
  final TextEditingController _typeController = TextEditingController();

  final CollectionReference _jobs =
      FirebaseFirestore.instance.collection('feedback');

  Future<void> _delete(String productId) async {
    await _jobs.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a feedback')));
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF26CBE6),
              Color(0xFF26CBC0),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: _height / 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "${loggedInUser.img}",
                              
                            ),
                            radius: _height / 10,
                          ),
                          SizedBox(
                            height: _height / 30,
                          ),
                          Text(
                              "${loggedInUser.firstName} ${loggedInUser.secondName}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height / 2.2),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 2.0))
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(_width / 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  headerChild('Total Work', 114),
                                  headerChild('Followers', 1205),
                                  headerChild('Rating', 4),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: _height / 20),
                          child: Column(
                            children: <Widget>[
                              infoChild(
                                _width,
                                Icons.email,
                                "EMAIL: ${loggedInUser.email}",
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              infoChild(_width, Icons.question_answer_rounded,
                                  "QUALIFICATION: ${loggedInUser.qualification}"),
                              const SizedBox(
                                height: 12,
                              ),
                              infoChild(_width, Icons.workspace_premium_rounded,
                                  "EXPERIENCE: ${loggedInUser.experience}"),
                              const SizedBox(
                                height: 12,
                              ),
                              infoChild(_width, Icons.location_on_sharp,
                                  "ADDRESS: ${loggedInUser.address}"),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: _height / 30),
                                child: Container(
                                  width: _width / 3,
                                  height: _height / 20,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF26CBE6),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(_height / 40)),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2.0,
                                            offset: Offset(0.0, 1.0))
                                      ]),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FeedBackSee(),
                                          ),
                                        );
                                      },
                                      child: Text('FeedBack',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget headerChild(String header, int value) => Expanded(
        child: Column(
      children: <Widget>[
        Text(header),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '$value',
          style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF26CBE6),
              fontWeight: FontWeight.bold),
        )
      ],
    ));

Widget infoChild(double width, IconData icon, data) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: width / 10,
            ),
            Icon(
              icon,
              color: const Color(0xFF26CBE6),
              size: 36.0,
            ),
            SizedBox(
              width: width / 20,
            ),
            Text(data)
          ],
        ),
        onTap: () {
          print('Info Object selected');
        },
      ),
    );

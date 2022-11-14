import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/Fragments_seller/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';



class FeedBackSee extends StatefulWidget {
  const FeedBackSee({super.key});

  @override
  State<FeedBackSee> createState() => _FeedBackSeeState();
}

class _FeedBackSeeState extends State<FeedBackSee> {
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
        .collection("feedback")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
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
      body: Container(
        child: StreamBuilder(
          stream: _jobs.snapshots(), //build connection
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length, //number of rows
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/feedback.jpg"),
                      title: Text(documentSnapshot['feedback']),
                      // subtitle: Text(documentSnapshot['description']),
                      trailing: SizedBox(
                        width: 100,
                        // child: Row(
                        //   children: [
                        //     IconButton(
                        //         icon: const Icon(Icons.delete),
                        //         onPressed: () => _delete(documentSnapshot.id)),
                        //   ],
                        // ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

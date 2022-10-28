import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Job",
                  hintStyle: TextStyle(fontSize: 15),
                ),
                onChanged: (val) {
                  setState(() {
                    inputText = val;
                    print(inputText);
                  });
                },
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("jobs")
                          .where("type", isGreaterThanOrEqualTo: inputText)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;

                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProductDetails(data))),
                              child: Card(
                                color: Colors.deepPurple[100],
                                elevation: 7,
                                child: ListTile(
                                  leading: Image.asset("assets/Images/app.png"),
                                  title: Text(
                                    data['type'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    data['description'],
                                    maxLines: 3,
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

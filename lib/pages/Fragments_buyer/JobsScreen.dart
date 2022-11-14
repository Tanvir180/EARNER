import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/Theme.dart';
import 'package:earner_app/model/Jobs_Models.dart';
import 'package:earner_app/widgets/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class JobsScreenBuyer extends StatefulWidget {
  const JobsScreenBuyer({Key? key}) : super(key: key);

  @override
  State<JobsScreenBuyer> createState() => _JobsScreenBuyerState();
}

class _JobsScreenBuyerState extends State<JobsScreenBuyer> {
  File? _image;
  final imagePicker = ImagePicker();
  String? url;
  String? _fileName;

  // text fields' controllers
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();

  Future uploadimg() async {
    Reference ref =
        FirebaseStorage.instance.ref('products/').child('$_fileName');
    await ref.putFile(_image!);
    url = await ref.getDownloadURL();
    print(url);
  }

  final CollectionReference _jobs =
      FirebaseFirestore.instance.collection('jobs');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please Fill The Document",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Please Fill The Document",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: _typeController,
                    decoration: const InputDecoration(labelText: 'Job Title'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Descriptipn',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    controller: _salaryController,
                    decoration: const InputDecoration(
                      labelText: 'Salary',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Email',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Phone Number',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    controller: _qualificationController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Qualification and Skill Required',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    controller: _experienceController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Experience Required',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: _image == null
                                    ? const Center(
                                        child: Text("Select the item image"),
                                      )
                                    : Image.file(_image!))
                          ],
                        ),
                      )),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      final pick = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        if (pick != null) {
                          _image = File(pick.path);
                          _fileName = pick.name;
                          if (_image != null) {
                            uploadimg().whenComplete(() => SnackBar(
                                  content: Text("Picture is selected"),
                                  duration: Duration(milliseconds: 400),
                                ));
                          }
                        } else {
                          final snackBar = SnackBar(
                            content: Text("No image selected"),
                            duration: Duration(milliseconds: 400),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(
                      "Add Image",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: const Text('POST'),
                      onPressed: () async {
                        Reference ref = FirebaseStorage.instance
                            .ref('products/')
                            .child('$_fileName');
                        await ref.putFile(_image!);
                        url = await ref.getDownloadURL();
                        print(url);
                        FirebaseFirestore firebaseFirestore =
                            FirebaseFirestore.instance;

                        final String type = _typeController.text;
                        final String description = _descriptionController.text;
                        final String salary = _salaryController.text;
                        final String email = _emailController.text;
                        final String phone = _phoneController.text;
                        final String qualification =
                            _qualificationController.text;
                        final String experience = _experienceController.text;
                        final String? img = url;

                        await _jobs.add({
                          "type": type,
                          "description": description,
                          "salary": salary,
                          "email": email,
                          "phone": phone,
                          "qualification": qualification,
                          "experience": experience,
                          "img": url,
                        });

                        _typeController.text = '';
                        _descriptionController.text = '';
                        _salaryController.text = '';
                        _emailController.text = '';
                        _phoneController.text = '';
                        _qualificationController.text = '';
                        _experienceController.text = '';
                        _imgController.text = '';
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _typeController.text = documentSnapshot['type'];
      _descriptionController.text = documentSnapshot['decription'];
      _salaryController.text = documentSnapshot['salary'];
      _phoneController.text = documentSnapshot['phone'];
      _emailController.text = documentSnapshot['email'];
      _experienceController.text = documentSnapshot['experience'];
      _qualificationController.text = documentSnapshot['qualification'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _typeController,
                  decoration: const InputDecoration(labelText: 'type'),
                ),
                TextField(
                  // keyboardType:
                  //     const TextInputType.numberWithOptions(decimal: true),
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String type = _typeController.text;
                    final String description = _descriptionController.text;

                    await _jobs
                        .doc(documentSnapshot!.id)
                        .update({"type": type, "description": description});
                    _typeController.text = '';
                    _descriptionController.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _jobs.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  // await _jobs.add({"name": name, "price": price});
  // await _jobs.update({"name": name, "price": price});
  // await _jobs.delete({"name": name, "price": price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: _jobs.snapshots(), //build connection
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length, //number of rows
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductDetails(documentSnapshot))),
                    child: Card(
                      color: Colors.indigo[200],
                      elevation: 7,
                      child: ListTile(
                        leading: Image.network(
                          documentSnapshot['img'],
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          documentSnapshot['type'],
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          documentSnapshot['description'],
                          maxLines: 4,
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => _update(documentSnapshot)),
                              IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      _delete(documentSnapshot.id)),
                            ],
                          ),
                        ),
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
// Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

























//     return MaterialApp(
//       theme: ThemeData(
//           colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
//       debugShowCheckedModeBanner: false,
//       home: const MyStatelessWidget(),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 1,
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           // title: Container(
//           //   alignment: Alignment.center,
//           //   child: const Text('Job Type',
//           //       textAlign: TextAlign.start,
//           //       style: TextStyle(
//           //           fontWeight: FontWeight.bold,
//           //           fontSize: 22,
//           //           color: Colors.white)),
//           // ),
//           backgroundColor: Colors.blueGrey,
//           toolbarHeight: 20,
//           bottom: const TabBar(
//             tabs: <Widget>[
//               Tab(
//                 child: Text(
//                   "Part Time",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Tab(
//                 child: Text(
//                   "Remote Job",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Tab(
//                 child: Text(
//                   "Full Time",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             Center(
//               child: Scaffold(
//                   body: ListView(
//                 children: <Widget>[
//                   const Card(
//                     color: Colors.lightBlueAccent,
//                     child: ListTile(
//                       title: Center(
//                         child: Text(
//                           'Part Time Job',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                         'Here is a second line.\n A sufficiently long subtitle warrants three lines.',
//                         maxLines: 3,
//                       ),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
                 
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                 ],
//               )),
//             ),
//             Center(
//               child: Scaffold(
//                   body: ListView(
//                 children: <Widget>[
//                   const Card(
//                     color: Colors.lightBlueAccent,
//                     child: ListTile(
//                       title: Center(
//                         child: Text(
//                           'Remote Job',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                         'Here is a second line.\n A sufficiently long subtitle warrants three lines.',
//                         maxLines: 3,
//                       ),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Image.asset("assets/Images/hridoy.jpg"),
//                       title: const Text('Two-line ListTile'),
//                       subtitle: const Text(
//                           'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//                       trailing: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                 ],
//               )),
//             ),
//             //const Center(
              


//               // Scaffold(
//                 // body: StreamBuilder<List<User>>(
//                 //     stream: readUsers(),
//                 //     builder: (context, snapshot) {
//                 //       if (snapshot.hasError) {
//                 //         return Text(
//                 //             "Something Went wrong... ${snapshot.error}");
//                 //       } else if (snapshot.hasData) {
//                 //         final users = snapshot.data!;

//                 //         return ListView(
//                 //           children: users.map(buildUser).toList(),
//                 //         );
//                 //       } else {
//                 //         return Center(child: CircularProgressIndicator());
//                 //       }
//                 //     }),
//               ),
//               //     body: ListView(
//               //   children: <Widget>[
//               //     const Card(
//               //       color: Colors.lightBlueAccent,
//               //       child: ListTile(
//               //         title: Center(
//               //           child: Text(
//               //             'Employee Hire',
//               //             style: TextStyle(
//               //               fontWeight: FontWeight.bold,
//               //               fontSize: 22,
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //     SizedBox(height: 20),
//               //     Card(
//               //       elevation: 5,
//               //       child: ListTile(
//               //         leading: Image.asset("assets/Images/hridoy.jpg"),
//               //         title: const Text('Two-line ListTile'),
//               //         subtitle: const Text(
//               //           'Here is a second line.\n A sufficiently long subtitle warrants three lines.',
//               //           maxLines: 3,
//               //         ),
//               //         trailing: const Icon(Icons.arrow_circle_right_rounded),
//               //       ),
//               //     ),
//               //     Card(
//               //       elevation: 5,
//               //       child: ListTile(
//               //         leading: Image.asset("assets/Images/hridoy.jpg"),
//               //         title: const Text('Two-line ListTile'),
//               //         subtitle: const Text(
//               //             'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//               //         trailing: const Icon(Icons.arrow_circle_right_rounded),
//               //       ),
//               //     ),
//               //     Card(
//               //       elevation: 5,
//               //       child: ListTile(
//               //         leading: Image.asset("assets/Images/hridoy.jpg"),
//               //         title: const Text('Two-line ListTile'),
//               //         subtitle: const Text(
//               //             'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//               //         trailing: const Icon(Icons.arrow_circle_right_rounded),
//               //       ),
//               //     ),
//               //     Card(
//               //       elevation: 5,
//               //       child: ListTile(
//               //         leading: Image.asset("assets/Images/hridoy.jpg"),
//               //         title: const Text('Two-line ListTile'),
//               //         subtitle: const Text(
//               //             'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//               //         trailing: const Icon(Icons.arrow_circle_right_rounded),
//               //       ),
//               //     ),
//               //     Card(
//               //       elevation: 5,
//               //       child: ListTile(
//               //         leading: Image.asset("assets/Images/hridoy.jpg"),
//               //         title: const Text('Two-line ListTile'),
//               //         subtitle: const Text(
//               //             'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//               //         trailing: const Icon(Icons.arrow_circle_right_rounded),
//               //       ),
//               //     ),
//               //     Card(
//               //       elevation: 5,
//               //       child: ListTile(
//               //         leading: Image.asset("assets/Images/hridoy.jpg"),
//               //         title: const Text('Two-line ListTile'),
//               //         subtitle: const Text(
//               //             'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
//               //         trailing: const Icon(Icons.arrow_circle_right_rounded),
//               //       ),
//               //     ),
//               //   ],
//               // )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Widget buildUser(User user) => ListTile(
// //       leading: CircleAvatar(child: Text('')),
// //       title: Text(user.name),
// //     );

// // Stream<List<User>> readUsers() => FirebaseFirestore.instance
// //     .collection('users-form-data')
// //     .snapshots()
// //     .map((snapshot) =>
// //         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());














// // class ElevatedCardExample extends StatelessWidget {
// //   const ElevatedCardExample({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Center(
// //       child: Card(
// //         child: SizedBox(
// //           width: 300,
// //           height: 100,
// //           child: Center(child: Text('Elevated Card')),
// //         ),
// //       ),
// //     );
// //   }
// // }














//     // Column(
//           //   children: const <Widget>[
//           //     ElevatedCardExample(),
//           //     FilledCardExample(),
//           //     FilledCardExample(),
//           //     FilledCardExample(),
//           //     OutlinedCardExample(),
//           //     Spacer(),
//           //   ],
//           // ),
// /// An example of the filled card type.
// ///
// /// To make a [Card] match the filled type, the default elevation and color
// /// need to be changed to the values from the spec:
// ///
// /// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
// // class FilledCardExample extends StatelessWidget {
// //   const FilledCardExample({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //         child: InkWell(
// //       splashColor: Colors.blue.withAlpha(30),
// //       onTap: () {
// //         debugPrint('Card tapped.');
// //       },
// //       child: Card(
// //         elevation: 5,
// //         color: Theme.of(context).colorScheme.surfaceVariant,
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[
// //             const ListTile(
// //               leading: Icon(Icons.album),
// //               title: Text('The Enchanted Nightingale'),
// //               subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: <Widget>[
// //                 TextButton(
// //                   child: const Text('BUY TICKETS'),
// //                   onPressed: () {/* ... */},
// //                 ),
// //                 const SizedBox(width: 8),
// //                 TextButton(
// //                   child: const Text('LISTEN'),
// //                   onPressed: () {/* ... */},
// //                 ),
// //                 const SizedBox(width: 8),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     ));
// //   }
// // }

// /// An example of the outlined card type.
// ///
// /// To make a [Card] match the outlined type, the default elevation and shape
// /// need to be changed to the values from the spec:
// ///
// /// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
// // class OutlinedCardExample extends StatelessWidget {
// //   const OutlinedCardExample({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Card(
// //         elevation: 0,
// //         shape: RoundedRectangleBorder(
// //           side: BorderSide(
// //             color: Theme.of(context).colorScheme.outline,
// //           ),
// //           borderRadius: const BorderRadius.all(Radius.circular(12)),
// //         ),
// //         child: const SizedBox(
// //           width: 300,
// //           height: 100,
// //           child: Center(child: Text('Outlined Card')),
// //         ),
// //       ),
// //     );
// //   }
// // }







//     // Scaffold(
//     //   body: SingleChildScrollView(
//     //     child: Padding(
//     //       padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
//     //       child: Column(
//     //         crossAxisAlignment: CrossAxisAlignment.start,
//     //         children: [
//     //           Padding(
//     //             padding: const EdgeInsets.only(top: 18.0),
//     //             child: Row(
//     //               children: [
//     //                 const SizedBox(
//     //                   width: 15,
//     //                 ),
//     //                 const Icon(Icons.search),
//     //                 const SizedBox(
//     //                   width: 15,
//     //                 ),
//     //                 const Text(
//     //                   "Search Jobs..",
//     //                   style: const TextStyle(color: Colors.grey),
//     //                 ),
//     //                 const Spacer(),
//     //                 Container(
//     //                   height: 50,
//     //                   width: 50,
//     //                   decoration: BoxDecoration(
//     //                     borderRadius: BorderRadius.circular(10),
//     //                     color: AppColors.deeppurple,
//     //                   ),
//     //                   child: const Padding(
//     //                     padding: EdgeInsets.all(8.0),
//     //                     child: Image(
//     //                       image: AssetImage("assets/Icons/Ic_Settings.png"),
//     //                       height: 40,
//     //                       color: AppColors.white,
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //           const SizedBox(
//     //             height: 35,
//     //           ),
//     //           const Text(
//     //             "All Jobs",
//     //             style: TextStyle(
//     //                 color: AppColors.deeppurple,
//     //                 fontSize: 18,
//     //                 fontWeight: FontWeight.w600),
//     //           ),
//     //           const Jobs_Models(),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
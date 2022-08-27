import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/login_page.dart';
import 'package:earner_app/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: Container(
          alignment: Alignment.topCenter,
          child: const Text(
            "EARNER",
          ),
        ),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            debugPrint('I am a material button');
          },
          shape: const StadiumBorder(),
          textColor: Colors.black,
          color: Colors.blue[300],
          splashColor: Colors.blue[900],
          child: const Text('Material Button'),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}


























//Scaffold(
//       appBar: buildAppBar(),
//       // body: const Body(),
//       //bottomNavigationBar: MyBottomNavBar(),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       leading: IconButton(
//         icon: SvgPicture.asset("assets/icon/menu.svg"),
//         onPressed: () {},
//       ),
//     );
//   }
// }














































// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();

//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("HomePage"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 150,
//                 child: Image.asset("assets/app2.png", fit: BoxFit.contain),
//               ),
//               const Text(
//                 "Welcome Back",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
//                   style: const TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               Text("${loggedInUser.email}",
//                   style: const TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               const SizedBox(
//                 height: 15,
//               ),
//               ActionChip(
//                   label: const Text("Logout"),
//                   onPressed: () {
//                     logout(context);
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // the logout function
//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const LoginPage()));
//   }
// }

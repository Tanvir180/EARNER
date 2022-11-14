import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earner_app/Theme.dart';
import 'package:earner_app/model/user_model.dart';
import 'package:earner_app/pages/Fragments_buyer/AlertsScreen.dart';
import 'package:earner_app/pages/Fragments_buyer/payment.dart';
import 'package:earner_app/pages/Fragments_buyer/ChatScreen.dart';
import 'package:earner_app/pages/Fragments_buyer/HomeScreen.dart';
import 'package:earner_app/pages/Fragments_buyer/JobsScreen.dart';
import 'package:earner_app/pages/Fragments_seller/AlertsScreen.dart';
import 'package:earner_app/pages/Fragments_seller/ChatScreen.dart';
import 'package:earner_app/pages/Fragments_seller/HomeScreen.dart';
import 'package:earner_app/pages/Fragments_seller/JobsScreen.dart';
import 'package:earner_app/pages/Fragments_seller/drawer.dart';
import 'package:earner_app/pages/Fragments_seller/payment.dart';

import 'package:earner_app/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';

class DashBoardBuyer extends StatefulWidget {
  const DashBoardBuyer({Key? key}) : super(key: key);

  @override
  State<DashBoardBuyer> createState() => _DashBoardBuyerState();
}

class _DashBoardBuyerState extends State<DashBoardBuyer> {
  int selectedIndex = 0;

  Widget getFragment() {
    if (selectedIndex == 0) {
      return const HomeScreenBuyer();
    } else if (selectedIndex == 1) {
      return const AlertsScreenBuyer();
    } else if (selectedIndex == 2) {
      return const JobsScreenBuyer();
    } else if (selectedIndex == 3) {
      return const BookmarkScreenBuyer();
    } else if (selectedIndex == 4) {
      return const AddWorkPageBuyer();
    }
    return const HomeScreenBuyer();
  }

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
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
        backgroundColor: Colors.cyan,
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
      body: getFragment(),

      //
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50), //New
              blurRadius: 25.0,
            )
          ],
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: Radius.circular(25)),
          color: AppColors.white,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/Ic_Home.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.grey)
                  .paddingTop(12),
              label: '',
              activeIcon: Image.asset('assets/Icons/Ic_Home.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.lightgreen)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/Ic_Alert.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.grey)
                  .paddingTop(20),
              label: '',
              activeIcon: Image.asset('assets/Icons/Ic_Alert.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.lightgreen)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/Ic_Bag.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.grey)
                  .paddingTop(12),
              label: '',
              activeIcon: Image.asset('assets/Icons/Ic_Bag.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.lightgreen)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/Ic_Bookmark.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.grey)
                  .paddingTop(12),
              label: '',
              activeIcon: Image.asset('assets/Icons/Ic_Bookmark.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.lightgreen)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/Ic_Chat.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.grey)
                  .paddingTop(12),
              label: '',
              activeIcon: Image.asset('assets/Icons/Ic_Chat.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.lightgreen)
                  .paddingTop(12),
            ),
          ],
          onTap: (val) {
            selectedIndex = val;
            setState(() {});
          },
          currentIndex: selectedIndex,
        ),
      ),
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

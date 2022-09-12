

import 'package:earner_app/Theme.dart';
import 'package:earner_app/model/Jobs_Models.dart';
import 'package:flutter/material.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: const Text('Job Type',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white)),
          ),
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 20,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.party_mode),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Scaffold(
                  body: ListView(
                children: <Widget>[
                  const Card(
                      child: const ListTile(
                          title: const Text('One-line ListTile'))),
                  const Card(
                    elevation: 5,
                    child: const ListTile(
                      leading: FlutterLogo(),
                      title: Text('One-line with leading widget'),
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      title: const Text('One-line with trailing widget'),
                      trailing: Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('One-line with both widgets'),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      title: const Text('One-line dense ListTile'),
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                        'Here is a second line.\n A sufficiently long subtitle warrants three lines.',
                        maxLines: 3,
                      ),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('One-line dense ListTile'),
                      dense: true,
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      leading: const FlutterLogo(size: 56.0),
                      title: const Text('Two-line ListTile'),
                      subtitle: Text('Here is a second line'),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      leading: const FlutterLogo(size: 72.0),
                      title: const Text('Three-line ListTile'),
                      subtitle: const Text(
                          'A sufficiently long subtitle warrants three lines.'),
                      trailing: Icon(Icons.more_vert),
                      isThreeLine: true,
                    ),
                  ),
                ],
              )),
            ),
            Center(
              child: Scaffold(
                  body: ListView(
                children: <Widget>[
                  const Card(
                      child: const ListTile(
                          title: const Text('One-line ListTile'))),
                  const Card(
                    elevation: 5,
                    child: const ListTile(
                      leading: FlutterLogo(),
                      title: Text('One-line with leading widget'),
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      title: const Text('One-line with trailing widget'),
                      trailing: Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('One-line with both widgets'),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      title: const Text('One-line dense ListTile'),
                      dense: true,
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset("assets/Images/hridoy.jpg"),
                      title: const Text('Two-line ListTile'),
                      subtitle: const Text(
                          'Here is a second line.\n A sufficiently long subtitle warrants three lines.'),
                      trailing: const Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('One-line dense ListTile'),
                      dense: true,
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      leading: const FlutterLogo(size: 56.0),
                      title: const Text('Two-line ListTile'),
                      subtitle: Text('Here is a second line'),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  ),
                  const Card(
                    child: const ListTile(
                      leading: const FlutterLogo(size: 72.0),
                      title: const Text('Three-line ListTile'),
                      subtitle: const Text(
                          'A sufficiently long subtitle warrants three lines.'),
                      trailing: Icon(Icons.more_vert),
                      isThreeLine: true,
                    ),
                  ),
                ],
              )),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}















// class ElevatedCardExample extends StatelessWidget {
//   const ElevatedCardExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Card(
//         child: SizedBox(
//           width: 300,
//           height: 100,
//           child: Center(child: Text('Elevated Card')),
//         ),
//       ),
//     );
//   }
// }














    // Column(
          //   children: const <Widget>[
          //     ElevatedCardExample(),
          //     FilledCardExample(),
          //     FilledCardExample(),
          //     FilledCardExample(),
          //     OutlinedCardExample(),
          //     Spacer(),
          //   ],
          // ),
/// An example of the filled card type.
///
/// To make a [Card] match the filled type, the default elevation and color
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
// class FilledCardExample extends StatelessWidget {
//   const FilledCardExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: InkWell(
//       splashColor: Colors.blue.withAlpha(30),
//       onTap: () {
//         debugPrint('Card tapped.');
//       },
//       child: Card(
//         elevation: 5,
//         color: Theme.of(context).colorScheme.surfaceVariant,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const ListTile(
//               leading: Icon(Icons.album),
//               title: Text('The Enchanted Nightingale'),
//               subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('BUY TICKETS'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('LISTEN'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

/// An example of the outlined card type.
///
/// To make a [Card] match the outlined type, the default elevation and shape
/// need to be changed to the values from the spec:
///
/// https://m3.material.io/components/cards/specs#0f55bf62-edf2-4619-b00d-b9ed462f2c5a
// class OutlinedCardExample extends StatelessWidget {
//   const OutlinedCardExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: Theme.of(context).colorScheme.outline,
//           ),
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//         ),
//         child: const SizedBox(
//           width: 300,
//           height: 100,
//           child: Center(child: Text('Outlined Card')),
//         ),
//       ),
//     );
//   }
// }







    // Scaffold(
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(top: 18.0),
    //             child: Row(
    //               children: [
    //                 const SizedBox(
    //                   width: 15,
    //                 ),
    //                 const Icon(Icons.search),
    //                 const SizedBox(
    //                   width: 15,
    //                 ),
    //                 const Text(
    //                   "Search Jobs..",
    //                   style: const TextStyle(color: Colors.grey),
    //                 ),
    //                 const Spacer(),
    //                 Container(
    //                   height: 50,
    //                   width: 50,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: AppColors.deeppurple,
    //                   ),
    //                   child: const Padding(
    //                     padding: EdgeInsets.all(8.0),
    //                     child: Image(
    //                       image: AssetImage("assets/Icons/Ic_Settings.png"),
    //                       height: 40,
    //                       color: AppColors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 35,
    //           ),
    //           const Text(
    //             "All Jobs",
    //             style: TextStyle(
    //                 color: AppColors.deeppurple,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w600),
    //           ),
    //           const Jobs_Models(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  


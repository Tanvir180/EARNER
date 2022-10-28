import 'package:carousel_slider/carousel_slider.dart';
import 'package:earner_app/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/searchScreen.dart';

class HomeScreenseller extends StatefulWidget {
  const HomeScreenseller({Key? key}) : super(key: key);

  @override
  State<HomeScreenseller> createState() => _HomeScreensellerState();
}

class _HomeScreensellerState extends State<HomeScreenseller> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1487528278747-ba99ed528ebc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      'https://images.unsplash.com/photo-1529400971008-f566de0e6dfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1635350736475-c8cef4b21906?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      'https://images.unsplash.com/photo-1593672715438-d88a70629abe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      'https://images.unsplash.com/photo-1628348068343-c6a848d2b6dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      'https://images.unsplash.com/photo-1588702547981-5f8fed370e68?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            // child: Text(
                            //   'No. ${imgList.indexOf(item)} image',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 20.0,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: "Search Job",
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                  onTap: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => SearchScreen())),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: true,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: const [
              //     Text(
              //       "Recommended for you",
              //       style: TextStyle(
              //           color: AppColors.deeppurple,
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600),
              //     ),
              //     Spacer(),
              //     Text(
              //       "More",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 15,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "People you may know",
                    style: TextStyle(
                        color: AppColors.deeppurple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "More",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 215,
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColors.lightgreen.withAlpha(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/Images/profile.png"),
                              radius: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Kratos Official",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "UI/UX Designer",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "7 Mutual Connections",
                              style: TextStyle(
                                color: Colors.black.withAlpha(90),
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Message",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/Icons/Ic_Bookmark.png"),
                                    height: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      height: 215,
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColors.lightgreen.withAlpha(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/Images/profile.png"),
                              radius: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Kratos Official",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "UI/UX Designer",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "7 Mutual Connections",
                              style: TextStyle(
                                color: Colors.black.withAlpha(90),
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Message",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/Icons/Ic_Bookmark.png"),
                                    height: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      height: 215,
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColors.lightgreen.withAlpha(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/Images/profile.png"),
                              radius: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Kratos Official",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "UI/UX Designer",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "7 Mutual Connections",
                              style: TextStyle(
                                color: Colors.black.withAlpha(90),
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Message",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/Icons/Ic_Bookmark.png"),
                                    height: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      height: 215,
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColors.lightgreen.withAlpha(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/Images/profile.png"),
                              radius: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Kratos Official",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "UI/UX Designer",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "7 Mutual Connections",
                              style: TextStyle(
                                color: Colors.black.withAlpha(90),
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Message",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/Icons/Ic_Bookmark.png"),
                                    height: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: const [
                  Text(
                    "All Jobs",
                    style: TextStyle(
                        color: AppColors.deeppurple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Recent Jobs",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

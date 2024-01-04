import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Controllers/home_page_controller.dart';
import 'package:flutter/scheduler.dart' show TickerProvider;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> Tab_icons = [
  "assets/images/cab.png",
  "assets/images/pnggtest_one.png",
  "assets/images/hotels.png",
  "assets/images/pnggtest_one.png",
  "assets/images/puncture.png",
  "assets/images/pnggtest_one.png",
  "assets/images/pnggtest_one.png",
  "assets/images/pnggtest_one.png",
  "assets/images/pnggtest_one.png",
];

List<String> title = [
  "Cab",
  "Restuarants",
  "Hotels",
  "Towing",
  "Puncture",
  "Reparing",
  "Drivers",
  "Fuels",
  "Hospitals",
];
  class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slide;
  late Animation<double> _spin;
  late Animation<double> _zoom;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _slide = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _spin = Tween<double>(begin: 0.9, end: 945).animate(_controller);
    _zoom = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SliderDrawer(
        key: _scaffoldKey,
        appBar: const SliderAppBar(
            appBarColor: Colors.white,
            title: Text("Quick Cab",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
        slider: Container(
          child: Column(
            children: [
              Container(
                height: height * 0.23,
                width: width * 1.0,
                color: Colors.amberAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.048),
                    CircularPercentIndicator(
                      radius: 43.0,
                      lineWidth: 10.0,
                      percent: 0.8,
                      animation: true,
                      animationDuration: 2550,
                      footer: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          "Profile Name",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue),
                        ),
                      ),
                      center: const CircleAvatar(
                        radius: 37.5,
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(
                  Icons.person_3,
                  color: Colors.orange,
                  size: 29,
                ),
                title: Text("Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.orange,
                  size: 29,
                ),
                title: Text("Help And Support",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.orange,
                  size: 29,
                ),
                title: Text("Setting",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
              ),
              const ListTile(
                leading: Icon(
                  Icons.login_outlined,
                  color: Colors.orange,
                  size: 29,
                ),
                title: Text("Log Out",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
              )
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.pink,
                height: height * 0.085,
                child :Center(
                  child : SlideTransition(
                position: _slide,
                  child: ScaleTransition(
                    scale: _zoom,
                    child: RotationTransition(
                      turns: _spin,
                    child: FadeTransition(
                      opacity: _fadeIn,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterLogo(size: 50.0),
                          Text(
                            'this is add banner',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),)

                // TODO commet out this code after account opening of Google Ads
                // child: AdWidget(
                //   ad: BannerAd(
                //     adUnitId: 'your_banner_ad_unit_id',
                //     request: AdRequest(),
                //     size: AdSize.banner,
                //     listener: BannerAdListener(
                //       onAdFailedToLoad: (Ad ad, LoadAdError error) {
                //         ad.dispose();
                //       },
                //     ),
                //   ),
                // ),

              ),
            ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: width / 1.57,
                        childAspectRatio: 1.85 / 1.5,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 20),
                    itemCount: Tab_icons.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          controller.navigateToTab(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                      Colors.white,
                                      Colors.white,
                                      // Color(0xff4CAF50),
                                      // Color(0xff4CAF50),
                                      // Color(0xffFFA500),
                                      Color(0xffffcb6a),
                                    ]),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(6, 7),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(22)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  Tab_icons[index],
                                  fit: BoxFit.cover,
                                  height: height * 0.109,
                                  width: height * 0.129,
                                ),
                                SizedBox(
                                  height : 10
                                ),
                                Text(
                                  title[index],
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: "heading",
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

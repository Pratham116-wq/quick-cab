import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> Tab_icons = [

  "assets/images/towing.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/cabimage.jpg",
  "assets/images/ambulance.jpg",

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

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.put(HomeController());

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
        child: Container(

            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: width / 2,
                  childAspectRatio: 1.5 / 1.5,
                  crossAxisSpacing: 14,
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
                              begin: Alignment.centerLeft,
                              colors: [
                                Colors.deepOrange,
                                Colors.orange,
                                Colors.amber
                              ]),

                          boxShadow: [
                      BoxShadow(
                      color: Colors.orange,
                      spreadRadius: 1,
                      blurRadius: 18,
                      offset: Offset(3, 3),
                    ),
                      ],
                          borderRadius: BorderRadius.circular(22)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            Tab_icons[index],
                            fit: BoxFit.cover,
                          ),
                          Text(
                            title[index],
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )),
      ),
    );
  }
}

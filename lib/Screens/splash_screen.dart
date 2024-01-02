import 'package:cab_tab/Screens/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 4000), () {
      Get.toNamed(Routes.REGISTRATION_PAGE);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Container(
            color: Colors.orange,
            height: height * 0.4,
            width: width * 1,
            child: Lottie.network(
                "https://lottie.host/220f0713-87ea-48b5-a5b3-07a5a428928a/e2EbXTLiJq.json"),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.3,
            width: width * 1,
            child: Lottie.network(
                'https://lottie.host/c8d8908e-d2b8-45f5-83f6-09e9be74cbb0/coZkf8g8GS.json',
                fit: BoxFit.cover),
          ),
          Text("Loading")
        ],
      ),
    );
  }
}

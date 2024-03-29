import 'package:cab_tab/Screens/login_page.dart';
import 'package:cab_tab/Screens/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:rounded_tabbar_widget/rounded_tabbar_widget.dart';

class CabTab extends StatefulWidget {
  const CabTab({super.key});

  @override
  State<CabTab> createState() => _CabTabState();
}

class _CabTabState extends State<CabTab> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          child:
          RoundedTabbarWidget(
          tabIcons: [
            Icons.home,
            Icons.home,
            Icons.chat,
            Icons.person,
          ],
          pages: [
            LoginPage(),
            LoginPage(),
            VerifyOtp(),
            LoginPage()
          ],
          selectedIndex: 0,
          onTabItemIndexChanged: (int index) {
            print('Index: $index');
          },
              ),
        ),
      );
  }
}

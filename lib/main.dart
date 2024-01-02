import 'package:cab_tab/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screens/homeScreen.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL_ROUTE,
      debugShowCheckedModeBanner: false,
      title: 'Quick Cab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: Scaffold(body: HomePage()),
    );
  }
}

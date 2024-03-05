// import 'package:e_commerce/presentation/screen/primary_screen/splash_screen/body.dart';
// import 'package:e_commerce/presentation/screen/secondary_screen/home_screen/body.dart';

import 'package:flutter/material.dart';

import 'presentation/screen/secondary_screen/custom_bottom_nav_bar/custom_bottom_navbar.dart';
// import 'test.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // home: HomeScreen(),
      home: CustomBottomNavbar(),
      // home: CarouselSliderDemo(),
    );
  }
}
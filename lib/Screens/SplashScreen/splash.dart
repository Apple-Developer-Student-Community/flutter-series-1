import 'package:community_app/Components/bottom_navigation_bar.dart';
import 'package:community_app/Screens/Attendance/home_page.dart';
import 'package:community_app/Screens/LoginScreen/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Change the duration as needed

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getString('jwt_token') != null;

    Widget nextScreen;
    if (isLoggedIn) {
      nextScreen = MyBottomNavBar();
    } else {
      nextScreen = LoginScreen();
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/think-different-7462048__480.webp'),
          const SpinKitChasingDots(
            color: Color.fromARGB(255, 252, 254, 255),
            size: 50.0,
          )
        ],
      )),
    );
  }
}

import 'package:community_app/Screens/FeedScreen/feed.dart';
import 'package:community_app/Screens/HomeScreen/profile.dart';
import 'package:community_app/Screens/LoginScreen/signup.dart';
import 'package:community_app/Screens/NotificationScreen/notification.dart';
import 'package:community_app/Screens/HomeScreen/home.dart';
import 'package:community_app/Screens/LoginScreen/login.dart';
import 'package:community_app/Screens/Timetable/timetable_home.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Components/bottom_navigation_bar.dart';
import 'Screens/SplashScreen/splash.dart';

void main() async {
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('mybox');
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getString('jwt_token') != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => const MyBottomNavBar(),
        '/splash': (context) => const SplashScreen(),
        '/feed': (context) => const FeedScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/timetable': (context) => const TimetableHome(),
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


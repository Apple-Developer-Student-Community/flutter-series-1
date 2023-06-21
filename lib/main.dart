import 'package:community_app/Screens/FeedScreen/feed.dart';
import 'package:community_app/Screens/NotificationScreen/notification.dart';
import 'package:community_app/Screens/HomeScreen/home.dart';
import 'package:community_app/Screens/LoginScreen/login.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Components/bottom_navigation_bar.dart';
import 'Screens/SplashScreen/splash.dart';

void main() async {
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        //'/notification': (context) => const NotificationScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


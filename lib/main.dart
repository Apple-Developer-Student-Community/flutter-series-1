import 'package:community_app/Screens/FeedScreen/feed.dart';
import 'package:community_app/Screens/HomeScreen/home.dart';
import 'package:community_app/Screens/LoginScreen/login.dart';

import 'package:flutter/material.dart';

import 'Screens/SplashScreen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => const MyHomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/feed': (context) => const FeedScreen(),
        '/login': (context) => const LoginScreen(),
        // '/notification': (context) => const NotificationScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


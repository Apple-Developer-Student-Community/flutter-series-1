import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("notification"),
        //backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.cloud_off,
                size: 50, color: Color.fromARGB(255, 225, 97, 11)),
            Center(
              child: Text("no new notification "),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:community_app/Screens/HomeScreen/Components/drawer.dart';
import 'package:flutter/material.dart';

import 'Components/components.dart';
import 'Components/body.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Components.buildAppBar(),
      body: Body(controller: _controller),
      drawer: MyDrawer()
    );
  }
}

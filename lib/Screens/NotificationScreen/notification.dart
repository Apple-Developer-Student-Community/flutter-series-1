import 'package:flutter/material.dart';

class NoticationScreen extends StatefulWidget {
  const NoticationScreen({super.key});

  @override
  State<NoticationScreen> createState() => _NoticationScreenState();
}

class _NoticationScreenState extends State<NoticationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
             
              Icon(Icons.cloud_off,size: 50, color:Color.fromARGB(255, 225, 97, 11)),
              Center(child: Text("no new notification ") , ),
            ],
          ),
        ),
       
      ),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
       darkTheme: ThemeData(primaryColor: Colors.black , primaryColorDark: Colors.black , brightness: Brightness.dark),
      
    );
  }
}

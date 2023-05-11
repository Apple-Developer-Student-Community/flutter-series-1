import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Community Feed",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
            child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 62, 64, 64), //background color
              child: Row(
                children: [
                  Container(
                    //icon
                    margin: const EdgeInsets.all(8.0),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "SrijanSamridh",
                    style: TextStyle(
                        color: Color.fromARGB(255, 220, 220, 220),
                        fontSize: 15),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Icon(
                      Icons.verified,
                      color: Color.fromARGB(255, 22, 123, 206),
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        )));
  }
}

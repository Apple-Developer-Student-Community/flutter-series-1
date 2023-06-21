import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
class DottedContainer extends StatelessWidget {
  const DottedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image(
              image: AssetImage("assets/icons/up-arrow.png"),
              height: 120,
              width: 100,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      DottedBorder(
        color: Colors.white,
        strokeWidth: 2,
        dashPattern: [
          5,
          5,
        ],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Text(
              "Add Subject",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )
    ]);;
  }
}

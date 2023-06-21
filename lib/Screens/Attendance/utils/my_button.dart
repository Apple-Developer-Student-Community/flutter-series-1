import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      color: kPrimarycolor,
      onPressed: onPressed,

    );
  }
}

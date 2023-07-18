import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ButtonRowPresent extends StatefulWidget {
  int num;
  int compare_num;
  final VoidCallback decreaseValue;
  final VoidCallback increaseValue;
  final void Function(int value) onValueChanged;

  ButtonRowPresent({Key? key,
    required this.num,
    required this.decreaseValue,
    required this.increaseValue,
    required this.onValueChanged,
    required this.compare_num

  }) : super(key: key);

  @override
  State<ButtonRowPresent> createState() => _ButtonRowPresentState();
}

class _ButtonRowPresentState extends State<ButtonRowPresent> {
  int minus(int num){
    if(num>0) {
      num = num - 1;
    }
    return num;
  }

  int plus(int num){
    if(num<widget.compare_num) {
      num = num + 1;
    }
    return num;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.minus),
            color: Colors.grey, onPressed:(){ widget.decreaseValue(); widget.onValueChanged(minus(widget.num));},
          ),
          SizedBox(width: 8),
          Text(widget.num.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(CupertinoIcons.add),

            onPressed: (){ widget.increaseValue(); widget.onValueChanged(plus(widget.num));},

            color: kPrimarycolor,

          )

        ],
      ),
    );
  }
}

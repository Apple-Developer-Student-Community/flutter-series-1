import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ButtonRow extends StatelessWidget {
  int num;
  //VoidCallback decreaseValue;

  ButtonRow({Key? key, required this.num, //required this.decreaseValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          MaterialButton(
            elevation: 0,
            height: 42,
            onPressed:(){},
            shape: CircleBorder(),

            color: Colors.grey,
            child: Icon(CupertinoIcons.minus),
          ),
          Text(num.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          MaterialButton(
            elevation: 0,
            height: 42,
            onPressed: (){},
            shape: CircleBorder(),
            color: kPrimarycolor,
            child: Icon(CupertinoIcons.add),
          )

        ],
      ),
    );
  }
}

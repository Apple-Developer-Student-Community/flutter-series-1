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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.minus),
            color: Colors.grey, onPressed: () {  },
          ),
          SizedBox(width: 8),
          Text(num.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(CupertinoIcons.add),

            onPressed: (){},

            color: kPrimarycolor,

          )

        ],
      ),
    );
  }
}

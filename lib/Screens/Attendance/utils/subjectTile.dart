import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../utils/constants.dart';
import '../subject_details.dart';

class subjectTile extends StatelessWidget {
  final String subName;
  final String percent;
  int? presents;
  int? classses;
  int? minpercent;
  //VoidCallback decreaseValue;
  //final double percent2;

  Function(BuildContext)? deleteFunction;
  subjectTile({
    Key? key,
    required this.subName,
    required this.percent,
    required this.deleteFunction,
    required this.minpercent,
    required this.presents,
    required this.classses,
    // required this.decreaseValue
    //required this.percent2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("percentage= "+percent );
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    SubjectDetail(
                      subjectName: subName,
                      percentage: percent,
                      present: presents ,
                      classes: classses,
                      minpercent: minpercent,
                      // decreaseValue:decreaseValue,
                    )));
          },
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subName, style: kTextStyle),
                Text(
                  percent + '%',
                  style: (double.tryParse(percent)! >= 75)
                      ? TextStyle(color: Colors.green, fontSize: 20)
                      : TextStyle(color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: kContainercolor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

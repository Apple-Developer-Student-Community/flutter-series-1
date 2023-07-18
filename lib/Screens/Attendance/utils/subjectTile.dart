import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../utils/constants.dart';
import '../subject_details.dart';

class subjectTile extends StatefulWidget {
  final String subName;
  final String percent;
  final int index;
  int? presents;
  int? classses;
  int? minpercent;
  Function() decreasePresentValue;
  Function() decreaseClassesValue;
  Function() increasePresentValue;
  Function() increaseClassesValue;

  Function(BuildContext)? deleteFunction;
  subjectTile({
    Key? key,
    required this.subName,
    required this.percent,
    required this.deleteFunction,
    required this.minpercent,
    required this.presents,
    required this.classses,
    required this.decreasePresentValue,
    required this.decreaseClassesValue,
    required this.increasePresentValue,
    required this.increaseClassesValue, required this.index
  }) : super(key: key);

  @override
  State<subjectTile> createState() => _subjectTileState();
}

class _subjectTileState extends State<subjectTile> {
  @override
  Widget build(BuildContext context) {
    print("percentage= "+widget.percent );
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deleteFunction,
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
                      minpercent: widget.minpercent,
                      decreaseClassesValue:widget.decreaseClassesValue,
                      decreasePresentValue: widget.decreasePresentValue,
                      increasePresentValue: widget.increasePresentValue,
                      increaseClassesValue: widget.increaseClassesValue, subjectIndex: widget.index,
                    )));
          },
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(widget.subName, style: kTextStyle)),
                Text( (widget.presents == 0 && widget.classses == 0)? "0%"
                  :(widget.percent) + '%',
                  style: (double.tryParse(widget.percent)! >= 75)
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

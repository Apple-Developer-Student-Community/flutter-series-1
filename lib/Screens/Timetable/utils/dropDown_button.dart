import 'package:community_app/Screens/Timetable/Groups/group1/tabbar_view.dart';
import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DropDownGroup extends StatefulWidget {
  final Function(int) onGradeSelected;

  const DropDownGroup({Key? key, required this.onGradeSelected}) : super(key: key);

  @override
  State<DropDownGroup> createState() => _DropDownGroupState();
}

class _DropDownGroupState extends State<DropDownGroup> {
  List<String> items = [
    'GROUP 1',
    'GROUP 2',
    'GROUP 3',
    'GROUP 4',
    'GROUP 5',
    'GROUP 6',
    'GROUP 7',
    'GROUP 8',
    'GROUP 9',
    'GROUP 10',
    'GROUP 11',
    'GROUP 12',
    'GROUP 13',
    'GROUP 14',
    'GROUP 15',
    'GROUP 16',
    'GROUP 17',
    'GROUP 18-A',
    'GROUP 18-B',
    'GROUP 19',
    'GROUP 20',
  ];

  int selectedGradeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DropdownButton<int>(
          underline: Container(),
          dropdownColor: Colors.black,
          borderRadius: BorderRadius.circular(5),
          value: selectedGradeIndex,
          onChanged: (int? newValue) {
            if (newValue != null) {
              widget.onGradeSelected(newValue);
              setState(() {
                selectedGradeIndex = newValue;
              });
            }
          },
          items: items.map<DropdownMenuItem<int>>(
                (String value) {
              int index = items.indexOf(value);
              return DropdownMenuItem<int>(
                value: index,
                child: Text(value, style: kTextStyle),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
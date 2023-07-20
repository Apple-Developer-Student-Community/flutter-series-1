import 'package:community_app/Screens/Timetable/Groups/group1/friday.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/monday.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/thursday.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/tuesday.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/wednesday.dart';
import 'package:community_app/Screens/Timetable/utils/subject_container.dart';
import 'package:flutter/material.dart';


class CustomTabView extends StatefulWidget {
  final int gradeIndex;
  const CustomTabView({Key? key, required this.gradeIndex}) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16),
        child: TabBarView(children:[
          MondayList(gradeIndex: widget.gradeIndex),
          TuesdayList(gradeIndex: widget.gradeIndex),
          WednesdayList(gradeIndex: widget.gradeIndex),
          ThursdayList(gradeIndex: widget.gradeIndex),
          FridayList(gradeIndex: widget.gradeIndex)

        ]

        ),
      ),
    );
  }
}

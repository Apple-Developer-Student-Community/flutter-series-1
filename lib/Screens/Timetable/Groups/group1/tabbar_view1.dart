import 'package:community_app/Screens/Timetable/Groups/group1/fri_g1.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/mon_g1.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/thursday_g1.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/tues_g1.dart';
import 'package:community_app/Screens/Timetable/Groups/group1/wed_g1.dart';
import 'package:community_app/Screens/Timetable/utils/subject_container.dart';
import 'package:flutter/material.dart';


class CustomTabView1 extends StatefulWidget {
  const CustomTabView1({Key? key}) : super(key: key);

  @override
  State<CustomTabView1> createState() => _CustomTabView1State();
}

class _CustomTabView1State extends State<CustomTabView1> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16),
        child: TabBarView(children:[
          MondayList1(),
          TuesdayList1(),
          WednesdayList1(),
          ThursdayList1(),
          FridayList1()

        ]

        ),
      ),
    );
  }
}

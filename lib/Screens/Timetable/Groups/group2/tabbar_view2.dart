import 'package:community_app/Screens/Timetable/Groups/group2/fri_g2.dart';
import 'package:community_app/Screens/Timetable/Groups/group2/thursday_g2.dart';
import 'package:community_app/Screens/Timetable/Groups/group2/tues_g2.dart';
import 'package:community_app/Screens/Timetable/Groups/group2/wed_g2.dart';
import 'package:community_app/Screens/Timetable/utils/subject_container.dart';
import 'package:flutter/material.dart';

import 'mon_g2.dart';


class CustomTabView2 extends StatefulWidget {
  const CustomTabView2({Key? key}) : super(key: key);

  @override
  State<CustomTabView2> createState() => _CustomTabView2State();
}

class _CustomTabView2State extends State<CustomTabView2> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16),
        child: TabBarView(children:[
          MondayList2(),
          TuesdayList2(),
          WednesdayList2(),
          ThursdayList2(),
          FridayList2()

        ]

        ),
      ),
    );
  }
}

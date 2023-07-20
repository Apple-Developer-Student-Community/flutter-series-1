import 'package:community_app/Screens/Timetable/utils/time_container.dart';
import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import '../../Database/data_g1.dart';
import '../../Database/data_g10.dart';
import '../../Database/data_g11.dart';
import '../../Database/data_g12.dart';
import '../../Database/data_g13.dart';
import '../../Database/data_g14.dart';
import '../../Database/data_g15.dart';
import '../../Database/data_g16.dart';
import '../../Database/data_g17.dart';
import '../../Database/data_g18A.dart';
import '../../Database/data_g18B.dart';
import '../../Database/data_g19.dart';
import '../../Database/data_g2.dart';
import '../../Database/data_g20.dart';
import '../../Database/data_g3.dart';
import '../../Database/data_g4.dart';
import '../../Database/data_g5.dart';
import '../../Database/data_g6.dart';
import '../../Database/data_g7.dart';
import '../../Database/data_g8.dart';
import '../../Database/data_g9.dart';

import '../../Database/timetable_entry.dart';
import '../../utils/subject_container.dart';

class ThursdayList extends StatefulWidget {
  final int gradeIndex;
  const ThursdayList({Key? key, required this.gradeIndex}) : super(key: key);

  @override
  State<ThursdayList> createState() => _ThursdayListState();
}

class _ThursdayListState extends State<ThursdayList> {
  List<List<List<TimetableEntry>>> gradeData = [
    DataG1,
    DataG2,
    DataG3,
    DataG4,
    DataG5,
    DataG6,
    DataG7,
    DataG8,
    DataG9,
    DataG10,
    DataG11,
    DataG12,
    DataG13,
    DataG14,
    DataG15,
    DataG16,
    DataG17,
    DataG18A,
    DataG18B,
    DataG19,
    DataG20
  ];

  @override
  Widget build(BuildContext context) {
    List<TimetableEntry> data = gradeData[widget.gradeIndex][3];
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                  var time = DateTime.now();
                  var hour = time.hour;
                  var min = time.minute;
                  var day = time.weekday;
                  print(day);
                  print(hour);
                  print(min);
                  return Column(
                    children: [
                      SubjectContainer(
                          subject: data[0].subject, classroom: data[0].classroom,
                          gradient: (day == 4 && (hour == 9 && min < 45))
                              ? kOrangeGradient
                              : kGreyGradient),

                      SubjectContainer(
                          subject: data[1].subject, classroom: data[1].classroom,
                          gradient: (day == 4 && ((hour == 9 && min >= 45) || (hour == 10 && min >= 0 && min < 30)))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[2].subject, classroom: data[2].classroom,
                          gradient: (day == 4 && ((hour == 10 && min >= 30) || (hour == 11 && min >= 0 && min < 15)))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[3].subject, classroom: data[3].classroom,
                          gradient: (day == 4 && (hour == 11 && min >= 15))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[4].subject, classroom: data[4].classroom,
                          gradient: (day == 4 && (hour == 12 && min < 45))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[5].subject, classroom: data[5].classroom,
                          gradient: (day == 4 && ((hour == 12 && min >= 45) || (hour == 13 && min >= 0 && min < 30)))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[6].subject, classroom: data[6].classroom,
                          gradient: (day == 4 && ((hour == 13 && min >= 30) || (hour == 14 && min >= 0 && min < 15)))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[7].subject, classroom: data[7].classroom,
                          gradient: (day == 4 && (hour == 14 && min >= 15))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[8].subject, classroom: data[8].classroom,
                          gradient: (day == 4 && (hour == 15 && min < 45))
                              ? kOrangeGradient
                              : kGreyGradient),


                      SubjectContainer(
                          subject: data[9].subject, classroom: data[9].classroom,
                          gradient: (day == 4 && ((hour == 15 && min >= 45) || (hour == 16 && min >= 0 && min < 30)))
                              ? kOrangeGradient
                              : kGreyGradient),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ffi';

import 'package:community_app/Screens/Timetable/utils/time_container.dart';
import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../utils/subject_container.dart';


class ThursdayList2 extends StatefulWidget {
  const ThursdayList2({Key? key}) : super(key: key);

  @override
  State<ThursdayList2> createState() => _ThursdayList2State();
}


class _ThursdayList2State extends State<ThursdayList2> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeContainer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                TimerBuilder.periodic(Duration(seconds: 1), builder: (context){
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
                          subject: 'PYTHON', classroom: 'TG-201', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && (hour==9 && min<45)) ?kOrangeGradient :kGreyGradient),

                      SubjectContainer(
                          subject: 'JAVA', classroom: 'TG-311', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && ((hour==9 && min>=45) || (hour==10 && min>=0 && min<30)))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'CN', classroom: 'TG-518', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && ((hour==10 && min>=30) || (hour==11 && min>=0 && min<15)))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'MATHS', classroom: 'TG-203', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && (hour==11 && min>=15))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'PYTHON', classroom: 'TG-401', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && (hour==12 && min<45))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'PYTHON', classroom: 'TG-401', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && ((hour==12 && min>=45) || (hour==13 && min>=0 && min<30)))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'PYTHON', classroom: 'TG-401', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && ((hour==13 && min>=30) || (hour==14 && min>=0 && min<15)))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'PYTHON', classroom: 'TG-401', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && (hour==14 && min>=15))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'PYTHON', classroom: 'TG-401', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && (hour==15 && min<45))?kOrangeGradient :kGreyGradient),


                      SubjectContainer(
                          subject: 'PYTHON', classroom: 'TG-401', teacher: 'Amanpreet Kaur',
                          gradient: (day==4 && ((hour==15 && min>=45) || (hour==16 && min>=0 && min<30)))?kOrangeGradient :kGreyGradient),


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

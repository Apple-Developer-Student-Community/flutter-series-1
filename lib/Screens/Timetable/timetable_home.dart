import 'package:community_app/Screens/Timetable/Groups/group1/tabbar_view.dart';
import 'package:community_app/Screens/Timetable/utils/dropDown_button.dart';
import 'package:community_app/Screens/Timetable/utils/tab_bar.dart';
import 'package:community_app/Screens/Timetable/utils/time_container.dart';
import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';


class TimetableHome extends StatefulWidget {
  const TimetableHome({Key? key}) : super(key: key);

  @override
  State<TimetableHome> createState() => _TimetableHomeState();
}

class _TimetableHomeState extends State<TimetableHome> {
  int selectedGradeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      var time = DateTime.now();
      var day = time.weekday;
      var dayfinal=0;
      if(day<=5){
        dayfinal=day-1;
      }


      return DefaultTabController(
        length: 5,
        initialIndex: dayfinal,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            title: Text("TIMETABLE"),
            backgroundColor: kPrimaryColor,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropDownGroup(onGradeSelected: (index) {
                setState(() {
                  selectedGradeIndex = index;
                });
              },),
              // Padding(
              //   padding: const EdgeInsets.only(left: 25.0, top: 20),
              //   child: Container(
              //     child: RichText(text: TextSpan(
              //         text: "GROUP", style: kTextStyle,
              //         children: <TextSpan>[
              //           TextSpan(text: " 1",
              //               style: kText3Style
              //           ),
              //         ]
              //     )
              //     ),
              //   ),
              // ),
              SizedBox(height: 20,),
              Custom_TabBar(),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25),
                child: Row(
                  children: [
                    Text('Time', style: kDetailPageTextStyle,),
                    SizedBox(width: 100,),
                    Text('Subject', style: kDetailPageTextStyle,)
                  ],
                ),
              ),
              CustomTabView(gradeIndex: selectedGradeIndex,),


            ],
          ),
        ),
      );

    }
    );
  }
}

import 'package:community_app/Screens/Attendance/utils/button_rowPresent.dart';
import 'package:community_app/Screens/Attendance/utils/button_rowClasses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../utils/constants.dart';
import 'home_page.dart' as home;

class SubjectDetail extends StatefulWidget {
  final int subjectIndex;
  var minpercent;
  Function() decreasePresentValue;
  Function() decreaseClassesValue;
  Function() increasePresentValue;
  Function() increaseClassesValue;

  SubjectDetail(
      {Key? key,
      required this.minpercent,
      required this.decreasePresentValue,
      required this.decreaseClassesValue,
      required this.increasePresentValue,
      required this.increaseClassesValue,
      required this.subjectIndex})
      : super(key: key);

  @override
  State<SubjectDetail> createState() => _SubjectDetailState();
}

class _SubjectDetailState extends State<SubjectDetail> {
  late String subjectName;
  late String percentage;
  late int present;
  late int classes;
  late int minpercent;

  @override
  void initState() {
    super.initState();
    loadSubjectDetails();
  }

  void loadSubjectDetails() {
    // Fetch subject details from the database using the subjectIndex
    subjectName = home.HomePage.db.subList[widget.subjectIndex][0];
    percentage = home.HomePage.db.subList[widget.subjectIndex][1];
    present = int.parse(home.HomePage.db.subList[widget.subjectIndex][2]);
    classes = int.parse(home.HomePage.db.subList[widget.subjectIndex][3]);
    minpercent = int.parse(home.HomePage.db.subList[widget.subjectIndex][4]);
  }

  // @override
  // void didUpdateWidget(SubjectDetail oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.subjectIndex != oldWidget.subjectIndex) {
  //     loadSubjectDetails();
  //   }
  // }

  double realtimePercentage(int present, int classes) {
    double _percent;

    if (classes == 0 || present == 0 || classes<present) {
      return 0.0;
    }

    _percent = ((present / classes) * 100);

    return _percent;
  }

  int maintainAtt(int classes, int present, int minpercent) {
    int att = 0;
    while (true) {
      if (((present + att) * 100) / (classes + att) >= minpercent) {
        return att;
      }
      att++;
    }
  }

  int maintainBunk(int classes, int present, int minpercent) {
    int bunk = 0;
    int miss = classes - present;
    while (true) {

      if (((present / (present + miss)) * 100 <= minpercent)) {
        int x = bunk - 1;
        if (x < 0) {
          return bunk;
        } else {
          return x;
        }
      }
      miss++;
      bunk++;
    }
  }


  @override
  Widget build(BuildContext context) {
    print('classes=====' + classes.toString());
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.5 - 20,
                          decoration: BoxDecoration(
                            gradient: kOrangeGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              top: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(subjectName,
                                        style: kSubjectTextStyle)),
                                FittedBox(
                                  child: Text(
                                      realtimePercentage(present, classes)
                                              .toStringAsFixed(2) +
                                          '%',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 35)),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          width: 175,
                          //color: Colors.red,
                          child: RichText(
                              text: TextSpan(
                                  text: "Percentage Required: ",
                                  style: kTextStyle,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: widget.minpercent.toString() + '%',
                                  style: GoogleFonts.poppins(
                                      fontSize: 26,
                                      color: kTextcolor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ])))
                    ],
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width * 0.5 - 14,
                      decoration: BoxDecoration(
                        color: kContainercolor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              radius: 68,
                              lineWidth: 17,
                              center: Text(
                                realtimePercentage(present, classes)
                                        .toStringAsFixed(2) +
                                    '%',
                                style: kDetailPageTextStyle,
                              ),
                              percent:
                                  ((realtimePercentage(present, classes) - 0) /
                                              (100 - 0)) *
                                          (1 - 0) +
                                      0,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor:
                                  (realtimePercentage(present, classes) >= 75)
                                      ? Colors.green
                                      : Colors.red,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Present:",
                              style: kDetailPageTextStyle,
                            ),
                            ButtonRowPresent(
                              num: present,
                              decreaseValue: widget.decreasePresentValue,
                              increaseValue: widget.increasePresentValue,
                              onValueChanged: (int value) {
                                setState(() {
                                  present = value;
                                });
                              }, compare_num: classes,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Total Classes:",
                              style: kDetailPageTextStyle,
                            ),
                            ButtonRowClasses(
                              num: classes,
                              decreaseValue: widget.decreaseClassesValue,
                              increaseValue: widget.increaseClassesValue,
                              onValueChanged: (int value) {
                                setState(() {
                                  classes = value;
                                });
                              }, compare_num: present,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kContainercolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: (realtimePercentage(present, classes) >= 75)
                    ? Center(
                        child: RichText(
                            text: TextSpan(
                                text: "Lectures you can Bunk: ",
                                style: kTextStyle,
                                children: <TextSpan>[
                            TextSpan(
                                text: maintainBunk(
                                        classes, present, widget.minpercent)
                                    .toString(),
                                style: kText3Style),
                          ])))

                    //textAlign: TextAlign.center,

                    : Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Lectures you need to Attend: ",
                            style: kText2Style,
                            children: <TextSpan>[
                              TextSpan(
                                text: maintainAtt(
                                        classes, present, widget.minpercent)
                                    .toString(),
                                style: kText3Style,
                              ),
                            ],
                          ),
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}

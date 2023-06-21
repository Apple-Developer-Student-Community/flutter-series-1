import 'package:community_app/Screens/Attendance/utils/button_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../utils/constants.dart';
import 'home_page.dart' as home;

class SubjectDetail extends StatelessWidget {
  final String subjectName;
  final String percentage;
  var present;
  var classes;
  var minpercent;
  //VoidCallback decreaseValue;


  SubjectDetail(
      {Key? key,
        required this.subjectName,
        required this.percentage,
        required this.present,
        required this.classes,
        required this.minpercent,
        //required this.decreaseValue
      })
      : super(key: key);

  int maintainAtt(int classes, int present, int minpercent) {
    int att = 0;
    while(true){
      if(((present+att)*100)/(classes+att) >= minpercent){
        return att;
      }
      att++;
    }
  }
  int maintainBunk(int classes, int present, int minpercent) {
    int bunk = 0;
    int miss = classes - present;
    while(true){
      if(((present/(present+miss))*100 <= minpercent)){
        return bunk-1;
      }
      miss++;
      bunk++;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
                          width: 175,
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
                                      style: GoogleFonts.poppins(
                                          color: kSubTextcolor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600)),
                                ),

                                FittedBox(
                                  child: Text(percentage + '%',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 35)),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: 50,),
                      Container(
                          width: 175,
                          //color: Colors.red,
                          child: RichText(text: TextSpan(
                              text: "Percentage Required: ", style: kTextStyle,
                              children: <TextSpan>[
                                TextSpan(text: minpercent.toString()+'%', style:  GoogleFonts.poppins(
                                    fontSize: 26,
                                    color: kTextcolor,
                                    fontWeight: FontWeight.w700

                                ),
                                ),
                              ]
                          )
                          ))
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 400,
                    width: 210,
                    decoration: BoxDecoration(
                      color: kContainercolor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          radius: 68,
                          lineWidth: 17,
                          center: Text(percentage+'%', style: kDetailPageTextStyle,),
                          percent:
                          ((double.tryParse(percentage)! - 0) / (100 - 0)) *
                              (1 - 0) +
                              0,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: (double.tryParse(percentage)! >= 75)
                              ? Colors.green
                              : Colors.red,

                        ),
                        SizedBox(height: 40,),
                        Text("Present:", style: kDetailPageTextStyle,),
                        ButtonRow(num: present, //decreaseValue: decreaseValue
                        ),
                        SizedBox(height: 20,),
                        Text("Total Classes:",style: kDetailPageTextStyle,),
                        ButtonRow(num: classes, //decreaseValue: decreaseValue,
                        )


                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kContainercolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: (double.tryParse(percentage)! <= 75)
                    ? Center(
                  child: RichText(text: TextSpan(
                    text:"Lectures you need to Attend: ",
                    style: kText2Style,
                    children: <TextSpan>[
                      TextSpan(text: maintainAtt(classes, present, minpercent).toString(),
                        style:kText3Style,
                      ),

                    ],
                  ),
                  ),
                )
                //textAlign: TextAlign.center,


                    :Center(
                  child: RichText(text: TextSpan(
                      text: "Lectures you can Bunk: ", style: kTextStyle,
                      children: <TextSpan>[
                        TextSpan(text: maintainBunk(classes, present, minpercent).toString(),
                            style:  kText3Style
                        ),
                      ]
                  )
                  ),
                ))
          ],
        ),

      ),
    );
  }
}

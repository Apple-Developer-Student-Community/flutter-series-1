import 'package:community_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectContainer extends StatelessWidget {

  String subject;
  String classroom;
  String teacher;
  Gradient gradient;

  SubjectContainer({Key? key, required this.subject, required this.classroom, required this.teacher, required this.gradient}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 34.0),
      child: UnconstrainedBox(
        child: Container(
          height: 130,
          width: MediaQuery.of(context).size.width*0.6,
          decoration:


    BoxDecoration(
    gradient: gradient,
    borderRadius: BorderRadius.circular(12)
    ),





          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject, style: kSubjectTextStyle,),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.solidBuilding, color: kSubTextcolor, size: 20,),
                      SizedBox(width: 8,),
                      Text(classroom, style: kClassTextStyle)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.solidUser, color: kSubTextcolor, size: 20,),
                      SizedBox(width: 8,),
                      Text(teacher, style: kClassTextStyle)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class TimeContainer extends StatefulWidget {
  const TimeContainer({Key? key}) : super(key: key);

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
              Text('9:00 AM', style: TextStyle(fontWeight: FontWeight.w800),),
              Text('9:45 AM'),

              SizedBox(height: 134),
              Text('9:45 AM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('10:30 AM'),

              SizedBox(height: 133),
              Text('10:30 AM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('11:15 AM'),

              SizedBox(height: 132),
              Text('11:15 AM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('12:00 PM'),

              SizedBox(height: 132),
              Text('12:00 PM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('12:45 PM'),

              SizedBox(height: 132),
              Text('12:45 PM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('1:30 PM'),

              SizedBox(height: 132),
              Text('1:30 PM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('2:15 PM'),

              SizedBox(height: 132),
              Text('2:15 PM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('3:00 PM'),

              SizedBox(height: 132),
              Text('3:00 PM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('3:45 PM'),

              SizedBox(height: 132),
              Text('3:45 PM', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('4:30 PM'),

            ],
          ),
          SizedBox(
            height: 1605,
              child: VerticalDivider(
                color: Colors.grey,
                  width: 40,
                thickness: 2,
              )
          )
        ],
      ),

    );
  }
}

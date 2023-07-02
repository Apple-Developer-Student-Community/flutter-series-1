import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';


class Custom_TabBar extends StatefulWidget {
  const Custom_TabBar({Key? key}) : super(key: key);

  @override
  State<Custom_TabBar> createState() => _Custom_TabBarState();
}

class _Custom_TabBarState extends State<Custom_TabBar> {
  @override
  Widget build(BuildContext context) {
    return const TabBar(
        indicatorColor: kPrimarycolor,
        labelColor: kPrimarycolor,
        indicatorWeight: 0.01,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(child: Text('MON')),
          Tab(child: Text('TUE')),
          Tab(child: Text('WED')),
          Tab(child: Text('THU')),
          Tab(child: Text('FRI')),
        ]);
  }
}


import 'package:community_app/Screens/HomeScreen/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int index = 1;
  final Screens = [
    Center(child: const Text("feed")),
    const MyHomeScreen(),
    Center(child: const Text("notification")),
  ];
  @override
  Widget build(BuildContext context) {
    // return LinearNavbar();
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: buildLinearNavBar(),
    );
  }

  CurvedNavigationBar buildCurvedNavigationBar() {
    return CurvedNavigationBar(
      color: Colors.black,
      backgroundColor: Colors.orange,
      items: <Widget>[
        Icon(Icons.home_filled, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.notifications, size: 30),
      ],
      onTap: (index) {
        //Handle button tap
        setState(() => this.index = index);
      },
    );
  }

  NavigationBarTheme buildLinearNavBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange))),
      child: NavigationBar(
          height: 45,
          backgroundColor: Colors.black.withOpacity(1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 1),
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: const [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: NavigationDestination(
                  icon: Icon(
                    Icons.dynamic_feed_outlined,
                  ),
                  selectedIcon: Icon(Icons.feed_outlined,
                      color: Colors.orange, size: 40),
                  label: 'Feed'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: NavigationDestination(
                  selectedIcon:
                  Icon(FontAwesomeIcons.home, color: Colors.orange, size: 30,),
                  icon: Icon(Icons.home_filled),
                  label: 'home'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: NavigationDestination(
                  selectedIcon:
                  Icon(Icons.circle_notifications_rounded, color: Colors.orange, size: 40),
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: 'notification'),
            ),
          ]),
    );
  }
}

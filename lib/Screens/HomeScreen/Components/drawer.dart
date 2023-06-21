import 'package:community_app/Screens/Attendance/home_page.dart';
import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kDrawercolor,
      child: ListView(

        children: [

          DrawerHeader(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: kContainercolor),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/icons/hacker.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Coder'),
                ),

              ],

            ),

          ),

          Column(

            children: [

              ListTile(
                onTap: (){
                  Navigator.pop(context);
                }
                ,

                title: Text('Home'),

                leading: Icon(Icons.home_rounded),

              ),

              ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
                ,

                title: Text('Attendance'),

                leading: Icon(Icons.edit_calendar_rounded),

              ),

              ListTile(

                title: Text('TimeTable'),

                leading: Icon(Icons.featured_play_list_rounded),

              ),

              ListTile(

                title: Text('Logout'),

                leading: Icon(Icons.logout),

              ),

            ],

          ),

        ],

      ),
    );
  }
}

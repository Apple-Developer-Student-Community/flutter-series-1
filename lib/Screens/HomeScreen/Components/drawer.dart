import 'package:community_app/Screens/Attendance/home_page.dart';
import 'package:community_app/Screens/Timetable/timetable_home.dart';
import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}


class _MyDrawerState extends State<MyDrawer> {

  String? userName;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name');
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('jwt_token');
    prefs.remove('name');

    Navigator.of(context).pushReplacementNamed('/login');
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
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
                  child: Text(userName?? "guest"),
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
                 Navigator.pushReplacementNamed(context, '/profile');
                }
                ,

                title: Text('Profile'),

                leading: Icon(Icons.person),

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
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimetableHome()));
                }
                ,

                title: Text('TimeTable'),

                leading: Icon(Icons.featured_play_list_rounded),

              ),

              GestureDetector(
                onTap: () {
                  logout();
                },
                child: ListTile(
              
                  title: Text('Logout'),
              
                  leading: Icon(Icons.logout),
              
                ),
              ),

            ],

          ),

        ],

      ),
    );
  }
}

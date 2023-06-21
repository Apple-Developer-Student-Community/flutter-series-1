import 'package:community_app/Screens/Attendance/utils/addSubject.dart';
import 'package:community_app/Screens/Attendance/utils/dotted_container.dart';
import 'package:community_app/Screens/Attendance/utils/subjectTile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../utils/constants.dart';
import 'data/database.dart';

class HomePage extends StatefulWidget {
  static SubjectDataBase db = SubjectDataBase();

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the hive box
  final _myBox = Hive.box('mybox');
  //late bool x=false;
  var minpercent;
  var percentage;
  var totalclasses;
  var presents;



  @override
  void initState() {
    // TODO: implement initState
    if(_myBox.get("TODOLIST") == null){
      HomePage.db.createInitialData();
    }
    else{
      HomePage.db.loadData();
    }
    super.initState();
  }

  //controller
  final controllerA = TextEditingController();
  final controllerB = TextEditingController();
  final controllerC = TextEditingController();
  final controllerD = TextEditingController();


  // void decreaseValue(int index) {
  //   setState(() {
  //     HomePage.db.subList[index][1]= HomePage.db.subList[index][1] - 1;
  //   });
  //   HomePage.db.updateDataBase();
  // }

  //save new subject
  void saveNewSub(){
    setState(() {
      totalclasses = int.tryParse(controllerC.text.trim());
      presents = int.tryParse(controllerB.text.trim());
      percentage = (presents! / totalclasses!) * 100;
      minpercent = int.tryParse(controllerD.text.trim());
      HomePage.db.subList.add([controllerA.text, percentage.toStringAsFixed(2), controllerB.text, controllerC.text, controllerD.text]);


      controllerA.clear();
      controllerB.clear();
      controllerC.clear();
      //controllerD.clear();
    });

    Navigator.of(context).pop();
    HomePage.db.updateDataBase();
  }

  // create new subject
  void createNewSub() {
    showDialog(
      context: context,
      builder: (context) {
        return AddSubject(
          subcontroller: controllerA,
          presentcontroller: controllerB,
          classcontroller: controllerC,
          mincontroller: controllerD,
          onSave: saveNewSub ,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  //delete subject
  void deleteSub(int index){
    setState(() {
      HomePage.db.subList.removeAt(index);
    });
    HomePage.db.updateDataBase();

  }



  @override
  Widget build(BuildContext context) {
    print(HomePage.db.subList);

    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("ATTENDANCE"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: kPrimarycolor,
              size: 35,
            ),
            onPressed: createNewSub,
          ),
        ],
      ),
      body: HomePage.db.subList.isEmpty? DottedContainer()
          :
      ListView.builder(
          itemCount: HomePage.db.subList.length,
          itemBuilder: (context, index) {
            return subjectTile(
              subName: HomePage.db.subList[index][0],
              percent: HomePage.db.subList[index][1],
              presents: int.tryParse(HomePage.db.subList[index][2]),
              classses: int.tryParse(HomePage.db.subList[index][3]),
              // decreaseValue: (context) => decreaseValue(index),
              deleteFunction: (context) => deleteSub(index),
              minpercent: int.tryParse(HomePage.db.subList[index][4]),



              // percent2: percentage,
            );

          }
      ),
    );
  }
}







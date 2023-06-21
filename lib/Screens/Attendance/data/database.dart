import 'package:hive/hive.dart';

class SubjectDataBase{
  List subList = [];
  // reference our box

  final _myBox = Hive.box('mybox');

  //run this method if first time opening the app
  void createInitialData(){
    // subList =[
    //   ["JAVA", "80","40","100","75"],
    // ];
  }

  // load data from the database
  void loadData(){
    subList = _myBox.get("TODOLIST");
  }
  // update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", subList);
  }
}
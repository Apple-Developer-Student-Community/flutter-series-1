import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'my_button.dart';

class AddSubject extends StatelessWidget {
  final subcontroller;
  final presentcontroller;
  final classcontroller;
  final mincontroller;

  VoidCallback onSave;
  VoidCallback onCancel;


  AddSubject({Key? key,
    required this.subcontroller,
    required this.presentcontroller,
    required this.classcontroller,
    required this.mincontroller,
    required this.onSave,
    required this.onCancel,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        backgroundColor: kBgcolor,
        title: Text("Add Subject", style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                        "Subject Name:", style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 100,
                        height: 34,
                        child: TextField(
                          controller: subcontroller,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: "Eg. JAVA",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: kPrimarycolor)),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Row(
                  children: [
                    Text("Total Presents:",
                        style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 60,
                        height: 34,
                        child: TextField(
                          controller: presentcontroller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white24,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: kPrimarycolor),
                              ),
                              hintText: "0",
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Row(
                  children: [
                    Text("Total Classes:",
                        style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 60,
                        height: 34,
                        child: TextField(
                          controller: classcontroller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white24,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: kPrimarycolor),
                              ),
                              hintText: "0",
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Row(
                  children: [
                    Text("Min Percentage:",
                        style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 60,
                        height: 34,
                        child: TextField(
                          controller: mincontroller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white24,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: kPrimarycolor),
                              ),
                              hintText: "75",
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(text: 'Cancel', onPressed: onCancel),
                SizedBox(width: 20,),
                MyButton(text: 'Add', onPressed: onSave)
              ]
          )
        ]
    );
  }
}

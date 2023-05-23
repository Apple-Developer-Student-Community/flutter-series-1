import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FounderScreen extends StatefulWidget {
  const FounderScreen({super.key});

  @override
  State<FounderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FounderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //main container
              height: 700,
              child: Stack(
                //for photo and box
                children: [
                  Container(
                    //for background photo
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/sikandPotrait.JPG"),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    //main column for box
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(56, 231, 223, 223)),
                        child: Column(
                          //column for text
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //container for text hi
                                  margin: const EdgeInsets.only(left: 20, top: 20),
                                  child: const Text(
                                    "Hi!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  //main container for icon of instagram
                                  width: 130,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          //container for first icon
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.black,
                                          ),
                                          child: IconButton(
                                              //1st icon
                                              onPressed: () {},
                                              icon: const Icon(
                                                FontAwesomeIcons.instagram,
                                                color: Color.fromARGB(
                                                    255, 226, 111, 35),
                                              ))),
                                      Container(
                                        //container for second icon
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.black,
                                        ),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.linkedin,
                                              color:
                                                  Color.fromARGB(255, 226, 111, 35),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20, top: 5),
                                  child: const Text(
                                    "I'm Sikand Dhingra",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 95,top: 10),
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),                              
                                  color: Colors.black,

                                  ),
                                  height: 35,
                                  
                                  child: const Center(child: Text("2nd year CSE",style: TextStyle(),)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  child: const Text(
                                    "Chief Content Officer",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(147, 143, 143, 1)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  child: const Text(
                                    "& Founding Member",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(147, 143, 143, 1)),
                                  ),
                                )//container for ending text &founding member
                              ],
                            )//ending of row of founding member
                          ],
                        ),//column ending for whole box content
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            Row(
                  
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 10),
                        child: Text(
                          "Speaker's Thought",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                      ),
                    ],
                    
                  ),
                  Container(margin: EdgeInsets.only(top: 20,left: 10),child: Text("Now that you are here, let me take a moment to tell you that this community is all about pycollence Each of its member is heavil talented and has the hunger to strive and thrive. If you want to stand out. this is the community to be in. It is all about IOS Development and more than MacOs")),
          ],
        ),
        
      ),
    );
  }
}

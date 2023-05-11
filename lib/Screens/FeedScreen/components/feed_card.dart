import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedCard extends StatelessWidget {
  FeedCard(
    this.name,//for name and caption of person 
    this.img, //for images 
    {
    super.key,
  });

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(//for card
      child: Column(//main page column
        children: [
          Container(//main container
            color: const Color.fromARGB(255, 62, 64, 64), //background color
            child: Row(//first row for logo,name and verified 
              children: [
                Container(//for first icon(person)
                  //icon
                  margin: const EdgeInsets.all(8.0),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Text(//name text
                  name,
                  style: TextStyle(
                      color: Color.fromARGB(255, 220, 220, 220), fontSize: 15),
                ),
                Container(//verified icon container
                  margin: const EdgeInsets.only(left: 5),
                  child: const Icon(
                    Icons.verified,
                    color: Color.fromARGB(255, 22, 123, 206),
                    size: 18,
                  ),
                )
              ],
            ),
          ),
          Image.asset(img),//main image 
          Container(//main container for like comment share 
            margin: EdgeInsets.all(7),
            child: Row(//for like comment share 
              children: const [
                Icon(
                  Icons.favorite_outline,
                  size: 30,
                  color: Color.fromARGB(255, 181, 176, 176),
                ),
                SizedBox(//for space between icons of like comment and share 
                  width: 10,
                ),
                Icon(FontAwesomeIcons.comment,color:Color.fromARGB(255, 181, 176, 176)),
                SizedBox(//for space between icons of like comment and share 
                  width: 10,
                ),
                Icon(Icons.send_outlined,color:Color.fromARGB(255, 181, 176, 176))
              ],
            ),
          ),
          Container(//container for number of likes and all
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Text("Liked by "),
                Text(
                  "Sukhman ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("and"),
                Text(
                  " 69696969 ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("others")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 6),
            child: Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              const   Text(" Need to Work Much more Harder!"),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 6),
              child: Row(children: [
                Text(
                  "comment yaha dekho",
                  style: TextStyle(color: Color.fromARGB(255, 181, 176, 176)),
                ),
              ])),
          Container(
              margin: EdgeInsets.only(left: 10, top: 6),
              child: Row(children: [
                Text("30 min ago",
                    style:
                        TextStyle(color: Color.fromARGB(255, 181, 176, 176))),
              ]//children
              )
              )
        ],
      ),
    );
  }
}

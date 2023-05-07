import 'package:community_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('This Is The Finest Community In Your Surrounding!',
                overflow: TextOverflow.visible,
                softWrap: true,
                style: GoogleFonts.laila(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Components.buildCustomSearchBar(widget._controller),
          TabBar(
              isScrollable: true,
              padding: const EdgeInsets.all(8.0),
              labelColor: kSecondaryColor,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelColor: Colors.grey,
              indicator: const BoxDecoration(
                borderRadius: null,
              ),
              controller: _tabController,
              tabs: const [
                Tab(text: 'All Events'),
                Tab(text: 'Ongoing Events'),
                Tab(text: 'Upcoming Events'),
              ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //method: customEventCard(imgUrl: " ", headertxt: "", basetxt: "", date: "")
                Components.customEventCard(
                    "assets/images/applelogo.webp",
                    "Bienvenue Apple",
                    "Inaugral Event. It was a great fun",
                    "Jan 1, 2023"),
                Components.customEventCard(
                    "assets/images/apple.webp",
                    "Workshop",
                    "To make everyone familiar with terminal.",
                    "Apill 8, 2023"),
                Components.customEventCard(
                    "assets/images/applehome.jpg",
                    "Reimagine",
                    "Design Event. Design the Future",
                    "May 1, 2023"),
                Components.customEventCard("assets/images/logoanimated.jpg",
                    "Evolve", "Introduction to Apple Silicon", "May 5, 2023"),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  'Special For You',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          //method: customBlogCard(imgUrl: " ", headertxt: "", basetxt: "")
          Components.customBlogCard("assets/icons/communityLogo.png",
              "Apple Developer Student Community", "About Community"),
          Components.customBlogCard("assets/images/sikand.png",
              "Founding Members & Their Stories", "About The Founders"),
          Components.customBlogCard("assets/images/sikand.png",
              "Building The Tech for Tomorrow", "Techstacks of Future"),
        ],
      ),
    );
  }
}

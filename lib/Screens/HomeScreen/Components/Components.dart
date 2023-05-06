import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants.dart';

class Components {
  static AppBar buildAppBar() {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: kButtonBg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: IconButton(
          icon: const Icon(Icons.widgets_outlined),
          onPressed: () {
            // todo: Ravneet add a Perform action
          },
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: kButtonBg,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // todo: Ravneet add a Perform action
            },
          ),
        ),
      ],
      backgroundColor: kPrimaryColor,
    );
  }

  static Padding buildCustomSearchBar(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: kButtonBg,
            prefixIcon: const Icon(
              Icons.fmd_good,
              color: kSecondaryColor,
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            hintText: 'Find Your Interest...',
            hintStyle: const TextStyle(color: kTertiaryColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(color: kSecondaryColor)),
          )),
    );
  }

  static Container customEventCard(
      String imgUrl, String headertxt, String basetxt, String eventdate) {
    return Container(
      height: 230,
      width: 180,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 42, 41, 41), Colors.black],
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 25,
              color: Color.fromARGB(31, 178, 173, 173),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imgUrl, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              headertxt,
              style: GoogleFonts.laila(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
            child: Text(
              basetxt,
              style: const TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 14,
                color: kTertiaryColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                eventdate,
              ),
              Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kSecondaryColor,
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    size: 20,
                  )))
            ],
          )
        ],
      ),
    );
  }

  static Container customBlogCard(
      String imgUrl, String headertxt, String basetxt) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 42, 41, 41), Colors.black],
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 25,
              color: Color.fromARGB(31, 178, 173, 173),
            ),
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                imgUrl,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headertxt,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: GoogleFonts.laila(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      basetxt,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.laila(
                        color: kTertiaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Read more...",
                    style: GoogleFonts.laila(
                        color: kSecondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

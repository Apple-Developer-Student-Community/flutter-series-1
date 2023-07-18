import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



//--------------------C O L O R S--------------------


const Color kBgcolor = Color(0xff1D1F21);
const Color kPrimarycolor = Color(0xffFF6600);
const Color kContainercolor = Color(0xff444648);
const Color kTextcolor = Color(0xffFFFFFF);
const Color kSubTextcolor = Color(0xffffffa1);
const Color kDrawercolor = Color(0xff1D1F21);
const Color kHintTextcolor = Color(0xff7F8487);
const Color kPrimaryColor = Colors.black;
const Color kSecondaryColor = Colors.orange;
const Color kTertiaryColor = Colors.grey;
const Color kButtonBg = Color.fromARGB(255, 43, 40, 40);



//--------------------S T Y L E S--------------------



TextStyle kTextStyle = GoogleFonts.poppins(
    fontSize: 22,
    color: kTextcolor
);

TextStyle kText2Style = GoogleFonts.poppins(
    fontSize: 20,
    color: kTextcolor
);
TextStyle kText3Style = GoogleFonts.poppins(
    fontSize: 22,
    color: kTextcolor,
    fontWeight: FontWeight.w600
);

TextStyle kDetailPageTextStyle = GoogleFonts.poppins(
    fontSize: 18,
    color: kTextcolor,
    fontWeight: FontWeight.w500
);

TextStyle kSubjectTextStyle = GoogleFonts.poppins(
    color: kSubTextcolor,
    fontSize: 24,
    fontWeight: FontWeight.w600
);

TextStyle kClassTextStyle = GoogleFonts.poppins(
    color: kSubTextcolor,
    fontWeight: FontWeight.w400
);



//--------------------G R A D I E N T S--------------------

const Gradient kOrangeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xffFF6600), Color(0xffff983f)]);

const Gradient kGreyGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xff1D1F21), Color(0xff1D1F21)]);



const LinearGradient customCardGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 42, 41, 41), Colors.black],
);

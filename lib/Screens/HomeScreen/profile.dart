import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import 'profileModel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  Future<UserProfile> fetchUserProfile(context) async {
    final String apiUrl = "https://apple-community-server.vercel.app/auth/";

    final prefs = await SharedPreferences.getInstance();
    final jwtToken = prefs.getString('jwt_token') ?? '';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'x-auth-token': jwtToken,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print('Response: ${response.body}');

        return UserProfile(
          name: responseData['name'] ?? '',
          rollNumber: responseData['rollNo'] ?? '',
          mobileNumber: responseData['mobile'] ?? '',
          email: responseData['email'] ?? '',
        );
        // The API request was successful. You can parse the response here.
      } else {
        // Handle errors here, e.g., response.statusCode is not 200.
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other exceptions here.
      print('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
    return UserProfile(
      name: '',
      rollNumber: '',
      mobileNumber: '',
      email: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          // Navigate back when the button is pressed

          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreyColor, // Customize the color as needed
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white, // Change icon color
              ),
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Handle edit button action here
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor, // Customize the color as needed
              ),
              child: Container()
              // Icon(
              //   Icons.edit,
              //   color: Colors.white, // Change icon color
              // ),
            ),
          ),
          SizedBox(
              width:
                  16), // Add some space between the edit button and the title
        ],
      ),
      body: FutureBuilder<UserProfile>(
        future: fetchUserProfile(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
            color: kSecondaryColor,
          )); // Show a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('Data not available.');
          } else {
            final userProfile = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          //height: 300,
                          decoration: BoxDecoration(
                              color: kGreyColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:20.0),
                            child: Column(
                              children: [
                                Text(
                                  userProfile.name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: kTextcolor,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Email: ${userProfile.email}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kTextcolor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Roll No: ${userProfile.rollNumber}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kTextcolor,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Mobile No: ${userProfile.mobileNumber}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kTextcolor,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9999,
                        //height: 300,
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

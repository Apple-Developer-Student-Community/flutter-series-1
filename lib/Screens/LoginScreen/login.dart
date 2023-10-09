import 'dart:convert';
import 'package:community_app/Components/bottom_navigation_bar.dart';
import 'package:community_app/Screens/Attendance/home_page.dart';
import 'package:community_app/Screens/HomeScreen/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'input_field.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final storage = const FlutterSecureStorage();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            color: kSecondaryColor,
          ));
        });

    print(emailController.text);

    const url =
        'https://apple-community-server.vercel.app/auth/signin'; // Replace with your actual API endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    print("Status code==${response.statusCode}");

    Navigator.pop(context);

    if (response.statusCode == 200) {
      // Navigator.pop(context);
      final responseBody = json.decode(response.body);
      print(responseBody);
      final user = responseBody['user'];
      final username = user['name'];
      print("Name: $username");
      final jwtToken = user['token'];

      // Store the JWT token securely
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt_token', jwtToken);
      prefs.setString('name', username);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyBottomNavBar()),
      );
    } else {
      final responseBody = json.decode(response.body);
      if (responseBody.containsKey('message')) {
        final errorMessage = responseBody['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    //passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: kTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InputField(
                    passwordcontroller: passwordController,
                    emailcontroller: emailController,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Rubik Regular',
                        color: kTextcolor,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    print("Button CLicked");
                    signIn();
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: kPrimarycolor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(
                        child: Text(
                          'login',
                          style: TextStyle(
                            fontFamily: 'Rubik Regular',
                            fontSize: 20,
                            color: kTextcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account?',
                        style: TextStyle(fontSize: 12, color: kTextcolor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                        },
                        child: const Text(
                          ' Register here',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik Medium',
                              color: kTextcolor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

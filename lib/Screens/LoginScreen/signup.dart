import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Components/bottom_navigation_bar.dart';
import '../../utils/constants.dart';
import 'input_field.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;

  const SignupScreen({Key? key, this.onTap}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final mobileController = TextEditingController();

  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  bool ismobileValid = true;
  bool isrollNoValid = true;

  void signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: kSecondaryColor),
          );
        });

    if (!isFieldsValid()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    if (passwordController.text != confirmController.text) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords don't match!")),
      );
      return;
    }

    const url = 'https://apple-community-server.vercel.app/auth/signup';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
        'name': nameController.text,
        'rollNo': rollNoController.text,
        'mobile': mobileController.text,
      }),
    );

    print(response.body);

    print(response.statusCode);

    final responseBody = json.decode(response.body);

    if (response.statusCode == 201) {

      if (responseBody.containsKey('message')) {
        final errorMessage = responseBody['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }

      // Navigate to the LoginScreen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    } else {
      Navigator.pop(context);
      if (responseBody.containsKey('message')) {
        final errorMessage = responseBody['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  bool isFieldsValid() {
    setState(() {
      isNameValid = nameController.text.isNotEmpty;
      ismobileValid = mobileController.text.isNotEmpty;
      isrollNoValid = rollNoController.text.isNotEmpty;
      isEmailValid = emailController.text.isNotEmpty;
      isPasswordValid = passwordController.text.isNotEmpty;
      isConfirmPasswordValid = confirmController.text.isNotEmpty;
    });

    return isNameValid &&
        ismobileValid &&
        isrollNoValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid;
  }

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Get on Board', style: kTextStyle),
                      Text(
                        "  Begin Your Soulful Journey Today",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Rubik Regular',
                            color: Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),

                // N A M E  ------------------>>>>

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: nameController,
                      style: const TextStyle(color: kTextcolor),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kTextcolor, width: 0.25),
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Name",
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.white38),
                        hintMaxLines: 3,
                        labelStyle: TextStyle(color: kTextcolor),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: kTextcolor,
                        ), // Hint text color
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          borderSide: BorderSide(
                              color: kTextcolor, width: 0.25), // Border color
                        ),
                      ),
                    ),
                  ),
                ),

                // R O L L   N U M B E R  ------------------>>>>

                SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: rollNoController,
                    style: const TextStyle(color: kTextcolor),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kTextcolor, width: 0.25),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Roll Number",
                      hintText: "Roll Number",
                      hintStyle: TextStyle(color: Colors.white38),
                      hintMaxLines: 3,
                      labelStyle: TextStyle(color: kTextcolor),
                      prefixIcon: const Icon(
                        Icons.class_,
                        color: kTextcolor,
                      ), // Hint text color
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                            color: kTextcolor, width: 0.25), // Border color
                      ),
                    ),
                  ),
                ),

                // M O B I L E   N U M B E R  ------------------>>>>

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: mobileController,
                      style: const TextStyle(color: kTextcolor),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kTextcolor, width: 0.25),
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Mobile Number",
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(color: Colors.white38),
                        hintMaxLines: 3,
                        labelStyle: TextStyle(color: kTextcolor),
                        prefixIcon: const Icon(
                          Icons.call,
                          color: kTextcolor,
                        ), // Hint text color
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          borderSide: BorderSide(
                              color: kTextcolor, width: 0.25), // Border color
                        ),
                      ),
                    ),
                  ),
                ),

                // E M A I L / P A S S W O R D  ------------------>>>>

                InputField(
                  passwordcontroller: passwordController,
                  emailcontroller: emailController,
                  // isEmailValid: isEmailValid,
                  // isPasswordValid: isPasswordValid,
                ),

                // C H E C K  P A S S W O R D  ------------------>>>>

                TextFormField(
                  obscureText: passwordVisible,
                  controller: confirmController,
                  style: const TextStyle(color: kTextcolor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kTextcolor, width: 0.25),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.white38),
                    hintMaxLines: 3,
                    labelStyle: TextStyle(color: kTextcolor),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kTextcolor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: kTextcolor,
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      borderSide: BorderSide(
                          color: kTextcolor, width: 0.25), // Border color
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                GestureDetector(
                  onTap: () {
                    signUp();
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kPrimarycolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Rubik Regular',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Rubik Regular',
                          color: kTextcolor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik Medium',
                            color: kTextcolor,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

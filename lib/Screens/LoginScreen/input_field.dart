
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class InputField extends StatefulWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  const InputField({
    Key? key,
    required this.passwordcontroller,
    required this.emailcontroller,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // You can add additional email validation logic here if needed
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // You can add additional password validation logic here if needed
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: widget.emailcontroller,
            validator: validateEmail,
            cursorColor: kTextcolor,
            style: const TextStyle(color: kTextcolor),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kTextcolor, width: 0.25),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: " example@gmail.com",
              hintStyle: TextStyle(color: Colors.white38),
              hintMaxLines: 3,
              labelStyle: TextStyle(color: kTextcolor),
              prefixIcon: const Icon(
                Icons.email,
                color: kTextcolor,
              ), // Hint text color
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                borderSide: BorderSide(
                    color: kTextcolor, width: 0.25), // Border color
              ),
            ), // Add validator
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              controller: widget.passwordcontroller,
              obscureText: passwordVisible,
              validator: validatePassword,
              cursorColor: kTextcolor,
              style: const TextStyle(color: kTextcolor),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kTextcolor, width: 0.25),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintStyle: TextStyle(color: Colors.white38),
                hintMaxLines: 3,
                labelStyle: TextStyle(color: kTextcolor),
                prefixIcon: Icon(
                  Icons.lock,
                  color: kTextcolor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility),
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
              ), // Add validator
              
            ),
          ),
        ),
      ],
    );
  }
}

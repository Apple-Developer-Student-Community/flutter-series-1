import 'package:flutter/material.dart';

class Components {
  static AppBar buildAppBar() {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 43, 40, 40),
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
            color: const Color.fromARGB(255, 43, 40, 40),
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
      backgroundColor: Colors.black,
    );
  }

  static Padding buildCustomSearchBar(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            prefixIcon: const Icon(
              Icons.fmd_good,
              color: Colors.orange,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white10),
              borderRadius: BorderRadius.circular(50.0),
            ),
            hintText: 'Find Your Interest...',
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(color: Colors.orange)),
          )),
    );
  }
}

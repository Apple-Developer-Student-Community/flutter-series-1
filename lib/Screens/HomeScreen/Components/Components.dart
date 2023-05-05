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

  static Container customEventCard() {
    return Container(
      height: 260,
      width: 220,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/applelogo.webp',
                  fit: BoxFit.contain),
            ),
          ),
          const Text(
            'Bienvenue Apple',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
            child: Text(
              'Inaugral Event. It was a great fun!',
              style: TextStyle(
                overflow: TextOverflow.visible,
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "May 5, 2023",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )))
            ],
          )
        ],
      ),
    );
  }

  static Container customBlogCard() {
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
                'assets/icons/communityLogo-modified.png',
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
                children: const [
                  Text(
                    'Apple Developer Student Community!',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'About Community!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Read more...',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
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

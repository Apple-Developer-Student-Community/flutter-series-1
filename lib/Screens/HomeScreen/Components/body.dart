import 'package:flutter/material.dart';
import 'Components.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'This Is The Finest Community In Your Surrounding!',
            overflow: TextOverflow.visible,
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Components.buildCustomSearchBar(_controller),
      ],
    );
  }
}

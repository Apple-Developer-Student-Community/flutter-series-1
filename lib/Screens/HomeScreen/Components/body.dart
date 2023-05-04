import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Components.dart';

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
        Components.buildCustomSearchBar(widget._controller),
        TabBar(
            isScrollable: true,
            padding: const EdgeInsets.all(8.0),
            labelColor: Colors.orange,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            unselectedLabelColor: Colors.grey,
            indicator: const BoxDecoration(
              borderRadius: null,
            ),
            controller: _tabController,
            tabs: const [
              Text('All Events'),
              Text('Ongoing Events'),
              Text('Upcoming Events'),
            ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Components.customEventCard(),
              Components.customEventCard(),
              Components.customEventCard(),
              Components.customEventCard(),
              Components.customEventCard(),
            ],
          ),
        ),
      ],
    );
  }
}

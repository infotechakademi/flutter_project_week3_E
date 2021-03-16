import 'package:flutter/material.dart';

class NavigationRailPage extends StatefulWidget {
  @override
  _NavigationRailPageState createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 60,
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              selectedIndex: _index,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.search),
                  label: Text("Search"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
              ],
              onDestinationSelected: (int newIndex) {
                setState(() {
                  _index = newIndex;
                });
              },
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Center(
              child: Text(_index.toString()),
            ),
          ),
        ],
      ),
    );
  }
}

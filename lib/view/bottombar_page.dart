import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int contentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: displaySubPageWithIndexStack(),
      bottomNavigationBar: bottomBar(),
    );
  }

  // 1. Yöntem
  Widget displaySubPageWithSwich() {
    switch (contentIndex) {
      case 0:
        return homeSubPage();
      case 1:
        return searchSubPage();
      case 2:
        return profileSubPage();
      default:
        return SizedBox();
    }
  }

  // 2. Yöntem
  Widget displaySubPageWithIndexStack() {
    return IndexedStack(
      index: contentIndex,
      children: [
        homeSubPage(),
        searchSubPage(),
        profileSubPage(),
      ],
    );
  }

  Widget homeSubPage() {
    return Center(
      child: FlutterLogo(
        size: 120,
      ),
    );
  }

  Widget searchSubPage() {
    return Center(child: Icon(CupertinoIcons.search));
  }

  Widget profileSubPage() {
    return ListView(
      children: [
        ListTile(
          title: Text("My Profile"),
        ),
        ExpansionTile(
          title: Text("Address Information"),
          subtitle: Text("Public"),
          children: [
            Text("City: İstanbul"),
            Text("Country: Turkey"),
          ],
        ),
        ExpansionTile(
          title: Text("Interests"),
          subtitle: Text("Private"),
          children: [
            Text("Interest 1"),
            Text("Interest 2"),
          ],
        ),
      ],
    );
  }

  bottomBar() {
    return BottomNavigationBar(
      currentIndex: contentIndex,
      items: barItems,
      onTap: (int newIndex) {
        print("newIndex $newIndex");
        setState(() {
          contentIndex = newIndex;
        });
      },
    );
  }

  List<BottomNavigationBarItem> barItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Search",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_hack20/view/eco_timeline/eco_timeline_page.dart';
import 'package:flutter_hack20/view/karma_timeline/karma_timeline_page.dart';
import 'package:flutter_hack20/view/profile/profile_page.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView();
  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          EcoTimelinePage(),
          KarmaTimelinePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('h'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('h'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('h'),
          ),
        ],
        onTap: (int index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

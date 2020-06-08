import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:trips/place/ui/screen/place_screen.dart';
import 'package:trips/user/ui/screen/search_screen.dart';
import 'package:trips/user/ui/screen/user_screen.dart';


class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  int _indexTap = 0;

  List<Widget> _pageList = [
    PlaceScreen(),
    SearchScreen(),
    UserScreen()
  ];

  void _onTapTapped(int index){
    setState(() {
      this._indexTap = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._indexTap],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => this._onTapTapped(index),
        currentIndex: this._indexTap,
        selectedItemColor: Colors.purple,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("")),
        ],
      ),
    );
  }
}

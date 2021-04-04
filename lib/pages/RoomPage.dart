import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liza/pages/parts/LightPage.dart';
import 'package:liza/pages/parts/PowerPage.dart';
import 'package:liza/pages/parts/SchedulePage.dart';

class RoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  int _currentIndex = 0;
  List<Widget> roomSettings = [
    PowerPage(),
    LightPage(),
    SchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room name'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink, Colors.white])),
        ),
      ),
      body: roomSettings[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.power,),
            label: 'Power',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Light',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Set schedule",
          ),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.pinkAccent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}

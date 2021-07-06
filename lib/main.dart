import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(home: BottomTabBarWidget()),
  );
}

class BottomTabBarWidget extends StatefulWidget {
  @override
  State<BottomTabBarWidget> createState() => _BottomTabBarWidget();
}

class _BottomTabBarWidget extends State<BottomTabBarWidget> {
  int _selectedIndex = 0;
  static const List _tabPages = [
    Text('I travel by Car'),
    Text('I like trains more'),
    Text('I like to ride my bycycle'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Demo'),
      ),
      body: Center(
        child: _tabPages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'Car'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_transit), label: 'Train'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bike), label: 'Bike'),
        ],
      ),
    );
  }
}

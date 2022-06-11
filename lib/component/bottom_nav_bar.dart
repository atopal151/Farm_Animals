import 'package:farm_animals/lists/animal/animals_list.dart';
import 'package:flutter/material.dart';

import '../lists/example/example_list.dart';

import '../lists/milk_Stock/milk_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AnimalsList(),
    ExampleList(),
    MilkStock(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_work_outlined, color: Colors.black26),
                label: "",
                activeIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.white),
                      //offset:Offset(0,4),
                    ],
                  ),
                  child: Icon(Icons.home_work),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined,
                    color: Colors.black26),
                label: "",
                activeIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.white),
                      //offset:Offset(0,4),
                    ],
                  ),
                  child: Icon(Icons.account_balance_wallet),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.architecture_outlined, color: Colors.black26),
                label: "",
                activeIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.white),
                      //offset:Offset(0,4),
                    ],
                  ),
                  child: Icon(Icons.architecture),
                )),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

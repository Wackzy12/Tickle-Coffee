import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/ticklemenu_screen.dart';
import 'screens/Activity_screen.dart';
import 'screens/profile_screen.dart';

class MainNavigator extends StatefulWidget {
  @override

  _MainNavigatorState createState() => _MainNavigatorState();

}

class _MainNavigatorState extends State<MainNavigator> {

  int _selectedIndex = 0;

  List<Widget> _screens = [
    HomeScreen(),
    MenuScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens [_selectedIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF112e12),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            onTap: (i) {
              setState(() {
                _selectedIndex = i;
              });
            },
            currentIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
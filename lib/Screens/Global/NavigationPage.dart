import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Screens/AddProduct.dart';
import 'package:laza_app/Screens/HomePage.dart';
import 'package:laza_app/Screens/Logout.dart';
import 'package:laza_app/Screens/favourits.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({super.key, required this.selectedIndex});
  int selectedIndex;
  @override
  State<NavigationPage> createState() => _MyAppState();
}

class _MyAppState extends State<NavigationPage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[widget.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          showSelectedLabels: false,
          selectedItemColor: ThemeColor,
          unselectedFontSize: 13,
          selectedFontSize: 15,
          unselectedItemColor: Color.fromRGBO(143, 149, 158, 1),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
          onTap: (value) {
            setState(() {
              widget.selectedIndex = value;
            });
          },
          currentIndex: widget.selectedIndex,
          items: [
            BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Text(
                'Home',
                style: TextStyle(
                  color: Color(0xFF9775FA),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
              icon: Text(
                'Home',
                style: TextStyle(
                  color: Color.fromRGBO(143, 149, 158, 1),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                tooltip: '',
                activeIcon: Image.asset(
                  'assets/Vector.png',
                  color: ThemeColor,
                ),
                icon: Image.asset('assets/Vector.png'),
                label: ''),
            BottomNavigationBarItem(
                tooltip: '',
                activeIcon: Image.asset(
                  'assets/Vector (1).png',
                  color: ThemeColor,
                ),
                icon: Image.asset('assets/Vector (1).png'),
                label: ''),
            BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Icon(
                Icons.logout,
                color: ThemeColor,
              ),
              icon: Icon(
                Icons.logout,
              ),
              label: '',
            ),
          ],
        ));
  }
}

List<Widget> pages = [
  HomePage(),
  favourits(),
  AddProduct(),
  Logout(),
];

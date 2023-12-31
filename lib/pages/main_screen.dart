import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/home_page.dart';
import 'package:food_recipe_app/pages/notifications_page.dart';
import 'package:food_recipe_app/pages/profile_page.dart';
import 'package:food_recipe_app/pages/search_page.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
   int index;
   MainScreen({
    super.key,
    required this.index,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
     SearchPage(
      searches: [],
    ),
    const NotificationPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigation(),
      body: _widgetOptions.elementAt(widget.index),
    );
  }

  Container _bottomNavigation() {
    return Container(
      decoration: const BoxDecoration(),
      alignment: Alignment.center,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BottomNavigationBar(
          currentIndex: widget.index,
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color.fromARGB(239, 11, 116, 182),
          // elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.index = index;
    });
  }
}

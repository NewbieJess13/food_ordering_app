import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:food_ordering_app/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.location_on,
    Icons.shopping_cart,
    Icons.menu
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CustomTabBar(
            icons:_icons,
            selectedIndex: _selectedIndex,
            onTap:(index)=> setState(()=> _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}

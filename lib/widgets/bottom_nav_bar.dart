import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.child});

  final Widget? child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  final List<String> _routes = [
    '/', // Home route
    '/course', // Course route
    '/settings' // Settings route
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
    GoRouter.of(context).go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        backgroundColor: Color(0xFF0d0d0d),
        bottomNavigationBar:Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: '2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '4',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '5',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentPageIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade700,
        )))));
  }
}

import 'package:flutter/material.dart';
import 'explore_tab.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _currentIndex = 0;

  // Dummy screens (replace with actual screen widgets later)
  final List<Widget> _tabs = [
    const ExploreTab(),         // Explore content (your current screen)
    Center(child: Text('My Booking')),
    Center(child: Text('Notification')),
    Center(child: Text('Account')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF4F9A81),
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.travel_explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'My Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'user_account_page.dart';
import 'user_alerts_page.dart';
import 'user_history_page.dart';
import 'user_home_page.dart';

class ToUserHomePage extends StatefulWidget {
  const ToUserHomePage({Key? key}) : super(key: key);

  @override
  State<ToUserHomePage> createState() => _ToUserHomePageState();
}

class _ToUserHomePageState extends State<ToUserHomePage> {
  int _selectedIndex = 0;
  final List screens = [
    const UserHomePage(),
    const UserHistoryPage(),
    const UserAlertsPage(),
    const UserAccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts_outlined),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
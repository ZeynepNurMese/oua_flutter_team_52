import 'package:flutter/material.dart';

import 'scrap_dealer_account_page.dart';
import 'scrap_dealer_alerts_page.dart';
import 'scrap_dealer_history_page.dart';
import 'scrap_dealer_home_page.dart';
import 'scrap_dealer_map_page.dart';

class ToScrapDealerHomePage extends StatefulWidget {
  const ToScrapDealerHomePage({Key? key}) : super(key: key);

  @override
  State<ToScrapDealerHomePage> createState() => _ToScrapDealerHomePageState();
}

class _ToScrapDealerHomePageState extends State<ToScrapDealerHomePage> {
  int _selectedIndex = 0;
  final List screens = [
    const ScrapDealerHomePage(),
    const ScrapDealerHistoryPage(),
    const ScrapDealerMapPage(),
    const ScrapDealerAlertsPage(),
    const ScrapDealerAccountPage(),
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
          icon: Icon(Icons.map),
          label: 'Map',
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
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/views/providers/dashboards/chats/index.dart';
import 'package:nyewadotid/src/views/providers/dashboards/orders/index.dart';
import 'package:nyewadotid/src/views/providers/dashboards/settings/index.dart';

class MainpageProvider extends StatefulWidget {
  const MainpageProvider({super.key});

  @override
  State<MainpageProvider> createState() => _MainpageProviderState();
}

class _MainpageProviderState extends State<MainpageProvider> {

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const OrderProvider(),
    const IndexChat(),
    const SettingsProvider(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.bag_check),
              activeIcon: Icon(Bootstrap.bag_check_fill),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.chat),
              activeIcon: Icon(Bootstrap.chat_fill),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.gear),
              activeIcon: Icon(Bootstrap.gear_fill),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          elevation: 0,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedFontSize: 12,
          selectedItemColor: GlobalVariable.secondaryColor,
          unselectedIconTheme: IconThemeData(color: GlobalVariable.secondaryColor.withOpacity(0.8)),
          selectedIconTheme: const IconThemeData(size: 25),
          unselectedItemColor: GlobalVariable.secondaryColor.withOpacity(0.8),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
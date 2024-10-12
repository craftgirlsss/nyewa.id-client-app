import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

import 'bookings/index.dart';
import 'home/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final globalVariable = GlobalVariable();
  final textStyle = GlobalTextStyle();
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Bookings(),
    const Text("Hello 3"),
    const Text("Hello 4"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: globalVariable.secondaryColor
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: globalVariable.backgroundColor,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.house_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(MingCute.paper_fill),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(AntDesign.message_fill),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.user_gear_solid),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: globalVariable.secondaryColor,
          selectedLabelStyle: textStyle.defaultTextStyleMedium(fontSize: 14),
          unselectedLabelStyle: textStyle.defaultTextStyleMedium(),
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(
            size: 25
          ),
          unselectedItemColor: Colors.white.withOpacity(0.6),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
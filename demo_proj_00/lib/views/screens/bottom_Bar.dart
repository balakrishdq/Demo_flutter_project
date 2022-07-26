import 'package:demo_proj_00/views/screens/home_screen.dart';
import 'package:demo_proj_00/views/screens/search_screen.dart';
import 'package:demo_proj_00/views/screens/trips_screen.dart';
import 'package:demo_proj_00/views/screens/user_profile.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    TripsScreen(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      //   title: Text(
      //     'BottomBar',
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () async {
      //         await AuthController().signOut();
      //       },
      //       icon: Icon(
      //         Icons.logout,
      //       ),
      //     ),
      //   ],
      // ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Color(0xFF526480),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_home_regular,
                ),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_search_regular,
                ),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_ticket_regular,
                ),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                label: "Ticket"),
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_person_regular,
                ),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: "Profile"),
          ]),
    );
  }
}

import 'package:find_my_school_updated/screens/bookmarks/bookmarks.dart';
import 'package:find_my_school_updated/screens/home/home.dart';
import 'package:find_my_school_updated/screens/notification/notifications.dart';
import 'package:find_my_school_updated/screens/search/search.dart';
import 'package:find_my_school_updated/screens/settings/settings.dart';
import 'package:find_my_school_updated/shared/constants.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  var _screens = [
    SearchScreen(),
    BookmarksScreen(),
    HomeScreen(),
    NotificationScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          search,
          bookmarks,
          home,
          notification,
          settings,
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.brown[400],
      //   elevation: 0.0,
      //   title: Text("Brew Crew"),
      //   actions: [
      //     FlatButton.icon(
      //         onPressed: () async {
      //           await _auth.signOut();
      //         },
      //         icon: Icon(
      //           Icons.logout,
      //           color: Colors.white,
      //         ),
      //         label: Text(
      //           "Logout",
      //           style: TextStyle(color: Colors.white),
      //         ))
      //   ],
      // ),
      body: _screens[_selectedIndex],
    );
  }
}

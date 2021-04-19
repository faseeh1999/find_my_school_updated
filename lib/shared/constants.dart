import 'package:flutter/material.dart';
import 'package:find_my_school_updated/services/auth.dart';

final AuthService _auth = AuthService();
IconButton logoutIcon = IconButton(
  icon: Icon(Icons.login_outlined),
  color: Colors.white,
  onPressed: () async {
    await _auth.signOut();
  },
);

BottomNavigationBarItem search = BottomNavigationBarItem(
  icon: Icon(
    Icons.search_outlined,
  ),
  label: "Search",
);

BottomNavigationBarItem home = BottomNavigationBarItem(
  icon: Icon(Icons.home_outlined),
  label: "Home",
);

BottomNavigationBarItem bookmarks = BottomNavigationBarItem(
  icon: Icon(Icons.star_border_outlined),
  label: "Bookmarks",
);

BottomNavigationBarItem settings = BottomNavigationBarItem(
  icon: Icon(Icons.settings),
  label: "Settings",
);

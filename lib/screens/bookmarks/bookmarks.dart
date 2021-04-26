import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Bookmarks",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Bookmarks Screen"),
      ),
    );
  }
}

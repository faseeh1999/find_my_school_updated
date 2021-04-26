import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/school_list.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/constants.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<School>>.value(
      value: DatabaseService().schools,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black, fontFamily: 'ss'),
          ),
          actions: [logoutIcon],
        ),
        drawer: MainDrawer(),
        body: SchoolList(),
      ),
    );
  }
}

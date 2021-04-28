import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/screens/notification/noti_list.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notifications>>.value(
      value: DatabaseService().notification,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Notifications",
            style: TextStyle(color: Colors.black, fontFamily: "ss"),
          ),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: NotificationList(),
      ),
    );
  }
}

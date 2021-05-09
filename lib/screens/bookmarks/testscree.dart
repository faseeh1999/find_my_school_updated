import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/bookmarks/test_list.dart';
import 'package:find_my_school_updated/screens/bookmarks/test_tile.dart';
import 'package:find_my_school_updated/screens/notification/noti_list.dart';
import 'package:find_my_school_updated/screens/notification/noti_tile.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final Notifications n1 = Notifications(title: "Heelo", message: "Testing");
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<Notifications>>(
        stream: DatabaseService(uid: user.uid).alerts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notifications = snapshot.data;
            return Scaffold(
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
              body: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return TestTile(
                      notification: notifications[index],
                    );
                  }),
              // body: TestList(),
            );
          }
        });
  }
}

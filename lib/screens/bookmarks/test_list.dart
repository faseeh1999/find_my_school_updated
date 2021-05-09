import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/screens/bookmarks/test_tile.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestList extends StatefulWidget {
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    List notifications = Provider.of<List<Notifications>>(context) ?? [];

    return ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return TestTile(
            notification: notifications[index],
          );
        });
  }
}

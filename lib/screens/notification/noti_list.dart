import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/screens/notification/noti_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    final notification = Provider.of<List<Notifications>>(context) ?? [];
    print(notification);

    return ListView.builder(
        itemCount: notification.length,
        itemBuilder: (context, index) {
          //notification[index]
          return NotificationTile(notification: notification[index]);
        });
  }
}

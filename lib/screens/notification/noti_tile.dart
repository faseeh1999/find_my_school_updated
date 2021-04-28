import 'package:find_my_school_updated/models/notification.dart';
import 'package:flutter/material.dart';
// final Notifications notification;
// NotificationTile({this.notification});

class NotificationTile extends StatefulWidget {
  final Notifications notification;
  NotificationTile({this.notification});

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            // backgroundImage: NetworkImage(widget.notification.text),
            backgroundColor: Colors.blueAccent,
            radius: 25.0,
          ),
          // title: Text(
          //   widget.notification.text,
          //   style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.045),
          // ),

          subtitle: Text("Hello",
              style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.038)),
          trailing: Icon(Icons.share_rounded),
        ),
      ),
    );
  }
}

import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final user = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 0.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.share_rounded,
                color: Colors.blueAccent,
              ),
              title: Text(
                "${widget.notification.title}",
                style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.04),
              ),
              subtitle: Text("${widget.notification.message}",
                  style: TextStyle(
                      fontFamily: 'ss', fontSize: size.width * 0.038)),
              // trailing: IconButton(
              //   icon: Icon(
              //     Icons.delete_outline_outlined,
              //     color: Colors.red[400],
              //   ),
              //   onPressed: () {},
              // ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            FlatButton.icon(
                onPressed: () async {
                  await DatabaseService(uid: user.uid).removeNotification();
                },
                icon:
                    Icon(Icons.delete_outline_outlined, color: Colors.red[400]),
                label: Text(
                  "Delete",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ss',
                      fontSize: size.width * 0.04,
                      color: Colors.red[400]),
                ))
          ],
        ),
      ),
    );
  }
}

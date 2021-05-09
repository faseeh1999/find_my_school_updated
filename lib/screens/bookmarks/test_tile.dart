import 'package:find_my_school_updated/models/notification.dart';
import 'package:flutter/material.dart';

class TestTile extends StatefulWidget {
  final Notifications notification;
  TestTile({this.notification});

  @override
  _TestTileState createState() => _TestTileState();
}

class _TestTileState extends State<TestTile> {
  @override
  Widget build(BuildContext context) {
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
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            FlatButton.icon(
                onPressed: null,
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

import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/screens/notification/noti_tile.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List notification = Provider.of<List<Notifications>>(context) ?? [];

    return Column(
      children: [
        Container(
          height: size.height * 0.25,
          width: size.width,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Always Stay",
                      style: TextStyle(
                        fontFamily: 'ss',
                        color: Colors.white,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Updated in Education",
                      style: TextStyle(
                        fontFamily: 'ss',
                        color: Colors.white,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
                size: size.width * 0.2,
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: notification.length,
              itemBuilder: (context, index) {
                return NotificationTile(notification: notification[index]);
              }),
        )
      ],
    );
  }
}

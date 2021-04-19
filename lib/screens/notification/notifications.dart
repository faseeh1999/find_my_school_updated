import 'package:find_my_school_updated/shared/constants.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [logoutIcon],
        title: Text("Notifications"),
      ),
      body: Center(
        child: Text("Notifications Screen"),
      ),
    );
  }
}

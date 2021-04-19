import 'package:find_my_school_updated/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [logoutIcon],
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}

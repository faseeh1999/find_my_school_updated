import 'package:find_my_school_updated/shared/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [logoutIcon],
        title: Text("Search"),
      ),
      body: Center(
        child: Text("Search Screen"),
      ),
    );
  }
}

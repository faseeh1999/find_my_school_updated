import 'package:find_my_school_updated/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.login_outlined),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
        title: Text("Home"),
      ),
    );
  }
}

import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/home.dart';
import 'package:find_my_school_updated/screens/login.dart';
import 'package:find_my_school_updated/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either home or authenicate widget
    final user = Provider.of<User>(context);

    if (user == null) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}

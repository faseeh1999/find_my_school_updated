import 'package:find_my_school_updated/screens/authenticate/login.dart';
import 'package:find_my_school_updated/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleForm() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleForm: toggleForm);
    } else {
      return RegisterScreen(toggleForm: toggleForm);
    }
  }
}

import 'package:find_my_school_updated/screens/login.dart';
import 'package:find_my_school_updated/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
      ),
      body: Center(
        child: IconButton(
            icon: Icon(
              Icons.skip_next_outlined,
              color: Colors.black,
              size: 50.0,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Wrapper()));
            }),
      ),
    );
  }
}

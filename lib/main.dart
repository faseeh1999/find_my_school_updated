import 'package:find_my_school_updated/screens/starting/splash.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/authenticate/authenticate.dart';
import 'package:find_my_school_updated/screens/home/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either home or authenicate widget
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

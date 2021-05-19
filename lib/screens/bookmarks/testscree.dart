import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/bookmarks/test_list.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Notifications>>.value(
      value: DatabaseService(uid: user.uid).alerts,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Notifications",
            style: TextStyle(color: Colors.black, fontFamily: "ss"),
          ),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: TestList(),
      ),
    );
  }
}

// StreamBuilder<List<Notifications>>(
//         stream: DatabaseService(uid: user.uid).alerts,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List notifications = snapshot.data ?? [];

//             return isLoading
//                 ? Loading()
//                 : Scaffold(
//                     appBar: AppBar(
//                       iconTheme: IconThemeData(color: Colors.black),
//                       elevation: 0.0,
//                       backgroundColor: Colors.white,
//                       title: Text(
//                         "Notifications",
//                         style: TextStyle(color: Colors.black, fontFamily: "ss"),
//                       ),
//                       centerTitle: true,
//                     ),
//                     drawer: MainDrawer(),
//                     body: ListView.builder(
//                         itemCount: notifications.length,
//                         itemBuilder: (context, index) {
//                           return TestTile(
//                             notification: notifications[index],
//                           );
//                         }),
//                     // body: TestList(),
//                   );
//           } else {
//             return Loading();
//           }
//         })

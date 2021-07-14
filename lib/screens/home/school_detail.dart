import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/home/school_advance.dart';
import 'package:find_my_school_updated/screens/home/school_basic.dart';

import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolDetail extends StatefulWidget {
  final School school;
  SchoolDetail({this.school});
  @override
  _SchoolDetailState createState() => _SchoolDetailState();
}

class _SchoolDetailState extends State<SchoolDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0.0,
            backgroundColor: primaryColor,
            centerTitle: true,
            title: Text(
              "School Detials",
              style: TextStyle(
                  fontFamily: 'ss',
                  fontSize: size.width * 0.05,
                  color: Colors.white),
            ),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(children: [
            SchoolBasic(
              school: widget.school,
            ),
            SchoolAdvance(
              school: widget.school,
            ),
            // SchoolReviews(
            //   school: widget.school,
            // )
            // SchoolReviews(
            //   school: widget.school,
            // )
          ])),
    );
  }
}

Widget menu() {
  return Material(
    color: primaryColor,
    child: TabBar(
      labelColor: Colors.white,
      indicatorColor: primaryColor,
      tabs: [
        Tab(
          text: "Basics",
          icon: Icon(Icons.info_outline),
        ),
        Tab(
          text: "Details",
          icon: Icon(Icons.assignment_outlined),
        ),
        // Tab(
        //   text: "Reviews",
        //   icon: Icon(Icons.rate_review_outlined),
        // )
      ],
    ),
  );
}

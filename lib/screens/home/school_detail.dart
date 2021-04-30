import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "School Detials",
              style: TextStyle(
                  fontFamily: 'ss',
                  fontSize: size.width * 0.05,
                  color: Colors.black),
            ),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width,

                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.school.bg),
                          )),
                      //color: primaryColor,
                      // child: Padding(
                      //   padding: const EdgeInsets.all(60.0),
                      //   child: Text(
                      //     widget.school.name,
                      //     style: TextStyle(
                      //       fontFamily: 'ss',
                      //       color: Colors.white,
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          height: size.height * 0.72,
                          width: size.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.1,
                                      ),
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(widget.school.image),
                                        backgroundColor: Colors.white,
                                        radius: size.width * 0.08,
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.favorite_border_outlined,
                                            color: primaryColor,
                                            size: size.width * 0.08,
                                          ),
                                          onPressed: null)
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Text(
                                    widget.school.name,
                                    style: TextStyle(
                                        fontSize: size.width * 0.045,
                                        fontFamily: 'ss',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  RatingBar.builder(
                                    itemSize: size.width * 0.04,
                                    initialRating: widget.school.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.blueAccent,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                      Icon(
                                        Icons.phone,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        widget.school.rating.toString(),
                                        maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.03),
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          widget.school.address,
                                          maxLines: 2,
                                          //overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'ss',
                                              fontSize: size.width * 0.03),
                                        ),
                                      ),
                                      Text(
                                        widget.school.contact,
                                        maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.03),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.alarm_add_rounded,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.015,
                                      ),
                                      Text(
                                        "Timings",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.03,
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width,

                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.school.bg),
                          )),
                      //color: primaryColor,
                      // child: Padding(
                      //   padding: const EdgeInsets.all(60.0),
                      //   child: Text(
                      //     widget.school.name,
                      //     style: TextStyle(
                      //       fontFamily: 'ss',
                      //       color: Colors.white,
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          height: size.height * 0.72,
                          width: size.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.1,
                                      ),
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(widget.school.image),
                                        backgroundColor: Colors.blueAccent,
                                        radius: size.width * 0.08,
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.favorite_border_outlined,
                                            color: primaryColor,
                                            size: size.width * 0.08,
                                          ),
                                          onPressed: null)
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Text(
                                    widget.school.name,
                                    style: TextStyle(
                                        fontSize: size.width * 0.045,
                                        fontFamily: 'ss',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  RatingBar.builder(
                                    itemSize: size.width * 0.04,
                                    initialRating: widget.school.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.blueAccent,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                      Icon(
                                        Icons.phone,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        widget.school.rating.toString(),
                                        maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.03),
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          widget.school.address,
                                          maxLines: 2,
                                          //overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'ss',
                                              fontSize: size.width * 0.03),
                                        ),
                                      ),
                                      Text(
                                        widget.school.contact,
                                        maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.03),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.alarm_add_rounded,
                                        color: primaryColor,
                                        size: size.width * 0.08,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.015,
                                      ),
                                      Text(
                                        "Timings",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.03,
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Monday      8:00 AM - 2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
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
      ],
    ),
  );
}

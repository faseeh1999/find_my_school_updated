import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SchoolDetail extends StatefulWidget {
  final School school;
  SchoolDetail({this.school});
  @override
  _SchoolDetailState createState() => _SchoolDetailState();
}

class _SchoolDetailState extends State<SchoolDetail> {
  bool isBookmarked = false;
  Icon favIcon = Icon(
    Icons.favorite_border_outlined,
    color: primaryColor,
  );
  Icon favIconFilled = Icon(
    Icons.favorite,
    color: primaryColor,
  );

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
                                          icon: isBookmarked
                                              ? favIconFilled
                                              : favIcon,
                                          onPressed: () async {
                                            setState(() {
                                              isBookmarked = true;
                                            });

                                            bool status = await DatabaseService(
                                                    uid: user.uid)
                                                .checkBookmark(widget.school);
                                            if (status) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Bookmark Already Present.",
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.black,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else if (status == false ||
                                                status == null) {
                                              await DatabaseService(
                                                      uid: user.uid)
                                                  .addBookmark(widget.school)
                                                  .whenComplete(() => {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Bookmark has been Added.",
                                                            toastLength: Toast
                                                                .LENGTH_LONG,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                Colors.black,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 16.0),
                                                      });
                                            }
                                          })
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
                                      IconButton(
                                        icon: Icon(Icons.public_outlined),
                                        color: primaryColor,
                                        iconSize: size.width * 0.08,
                                        onPressed: () {
                                          launch('${widget.school.webUrl}');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.location_on_outlined),
                                        color: primaryColor,
                                        iconSize: size.width * 0.08,
                                        onPressed: () {
                                          launch('${widget.school.location}');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.phone),
                                        color: primaryColor,
                                        iconSize: size.width * 0.08,
                                        onPressed: () {
                                          launch(
                                              "tel://${widget.school.contact}");
                                        },
                                      )
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
                                        "Website",
                                        //maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Location",
                                        maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
                                      ),
                                      Text(
                                        "Contact",
                                        maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.04),
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Monday to Thursday       ${widget.school.openingtiming} AM - ${widget.school.normaltiming} PM",
                                            style: TextStyle(
                                                fontFamily: 'ss',
                                                fontSize: size.width * 0.04),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          Text(
                                            "Friday                                     ${widget.school.openingtiming} AM - ${widget.school.fridaytiming} PM",
                                            style: TextStyle(
                                                fontFamily: 'ss',
                                                fontSize: size.width * 0.04),
                                          ),
                                        ],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(widget.school.image),
                                        backgroundColor: Colors.blueAccent,
                                        radius: size.width * 0.08,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.school.name,
                                      style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontFamily: 'ss',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.school.address +
                                          " " +
                                          widget.school.city +
                                          " " +
                                          widget.school.province,
                                      style: TextStyle(
                                          fontFamily: 'ss',
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.school.sector +
                                          " " +
                                          widget.school.category,
                                      style: TextStyle(
                                          fontFamily: 'ss',
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Text(
                                    "Curriculum",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.05),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Text(
                                    "${widget.school.curriculum}",
                                    style: TextStyle(
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.037,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Text(
                                    "Fee Range",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.05),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Text(
                                    "This School Fee Ranges from RS: ${widget.school.lowerfeerange} to RS: ${widget.school.upperfeerange} per month.",
                                    style: TextStyle(
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.038,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Text(
                                    "Fee Structure",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.05),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Text(
                                    "${widget.school.feedetails}",
                                    style: TextStyle(
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.037,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        launch('${widget.school.webUrl}');
                                      },
                                      child: Text(
                                        "More Deatils",
                                        style: TextStyle(
                                            color: Colors.transparent,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  offset: Offset(0, -5))
                                            ],
                                            decorationColor: Colors.black,
                                            decorationStyle:
                                                TextDecorationStyle.dashed,
                                            decorationThickness:
                                                size.width * 0.005,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.05),
                                      ),
                                    ),
                                  )
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

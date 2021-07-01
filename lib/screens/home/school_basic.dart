import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SchoolBasic extends StatefulWidget {
  final School school;
  SchoolBasic({this.school});

  @override
  _SchoolBasicState createState() => _SchoolBasicState();
}

class _SchoolBasicState extends State<SchoolBasic> {
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
    return Column(
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
                        Colors.black.withOpacity(0.5), BlendMode.darken),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  icon: isBookmarked ? favIconFilled : favIcon,
                                  onPressed: () async {
                                    setState(() {
                                      isBookmarked = true;
                                    });

                                    bool status =
                                        await DatabaseService(uid: user.uid)
                                            .checkBookmark(widget.school);
                                    if (status) {
                                      Fluttertoast.showToast(
                                          msg: "Bookmark Already Present.",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else if (status == false ||
                                        status == null) {
                                      await DatabaseService(uid: user.uid)
                                          .addBookmark(widget.school)
                                          .whenComplete(() => {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Bookmark has been Added.",
                                                    toastLength:
                                                        Toast.LENGTH_LONG,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.black,
                                                    textColor: Colors.white,
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
                            ignoreGestures: true,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  launch("tel://${widget.school.contact}");
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

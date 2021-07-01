import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class SchoolAdvance extends StatefulWidget {
  final School school;
  SchoolAdvance({this.school});
  @override
  _SchoolAdvanceState createState() => _SchoolAdvanceState();
}

class _SchoolAdvanceState extends State<SchoolAdvance> {
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
                                ShareSchool(context, widget.school);
                              },
                              child: Text(
                                "Share with others",
                                style: TextStyle(
                                    color: Colors.transparent,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, -5))
                                    ],
                                    decorationColor: Colors.black,
                                    decorationStyle: TextDecorationStyle.dashed,
                                    decorationThickness: size.width * 0.005,
                                    decoration: TextDecoration.underline,
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
    );
  }

  void ShareSchool(BuildContext cotext, School school) {
    final String text =
        "Check Out This School From Find My School App\nName: ${school.name}\nContact: ${school.contact}\nAddress: ${school.address}\nCity: ${school.city}\nProvince: ${school.province}\nOpening Timing: ${school.openingtiming} AM\nClosing Timing: ${school.normaltiming} PM";
    Share.share(text, subject: "Find My School School Deatils ${school.name}");
  }
}

import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/review_tile.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolReviews extends StatefulWidget {
  final School school;
  SchoolReviews({this.school});

  @override
  _SchoolReviewsState createState() => _SchoolReviewsState();
}

class _SchoolReviewsState extends State<SchoolReviews> {
  List<String> items = ["Hola", "1", "2"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Center(
                child: Container(
                  height: size.height * 0.7,
                  width: size.width * 0.9,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.03),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(widget.school.image),
                                backgroundColor: Colors.blueAccent,
                                radius: size.width * 0.08,
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            "Here are some Reviews of",
                            style: TextStyle(
                                fontFamily: 'ss', fontSize: size.width * 0.06),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            "${widget.school.name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontFamily: 'ss',
                                fontSize: size.width * 0.06),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                              height: size.height * 0.6,
                              child: Scrollbar(
                                isAlwaysShown: false,
                                child: new ListView.builder(
                                    itemCount: widget.school.reviews.length,
                                    //itemCount: widget.school.reviews.length ?? 3,
                                    itemBuilder: (context, index) {
                                      // return Text(items[index]);
                                      return ReviewTile(
                                        review: widget.school.reviews[index],
                                      );
                                    }),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )

            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   CircleAvatar(
            //                     backgroundImage:
            //                         NetworkImage(widget.school.image),
            //                     backgroundColor: Colors.blueAccent,
            //                     radius: size.width * 0.08,
            //                   ),
            //                 ],
            //               ),
            //               SizedBox(
            //                 height: size.height * 0.02,
            //               ),
            //               Align(
            //                 alignment: Alignment.center,
            //                 child: Text(
            //                   widget.school.name,
            //                   style: TextStyle(
            //                       fontSize: size.width * 0.045,
            //                       fontFamily: 'ss',
            //                       fontWeight: FontWeight.w700),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: size.height * 0.02,
            //               ),
            //               Align(
            //                 alignment: Alignment.center,
            //                 child: Text(
            //                   "Following are user Reviews",
            //                   style: TextStyle(
            //                       fontFamily: 'ss',
            //                       fontSize: size.width * 0.05,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: size.height * 0.04,
            //               ),
            //               Expanded(
            //                   child: ListView.builder(
            //                       itemCount: widget.school.reviews.length,
            //                       itemBuilder: (context, index) {
            //                         return ReviewTile(
            //                           review: widget.school.reviews[index],
            //                         );
            //                       })),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}

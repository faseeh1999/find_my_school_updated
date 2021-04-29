import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/school_detail.dart';

import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SchoolTile extends StatefulWidget {
  final School school;
  SchoolTile({this.school});

  @override
  _SchoolTileState createState() => _SchoolTileState();
}

class _SchoolTileState extends State<SchoolTile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isBookmarked = false;

  void addBookmarkToFirebase() async {
    // final FirebaseUser user = await auth.currentUser();
    // await DatabaseService(uid: user.uid).addBookmark(widget.school.sid);
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void removeBookmarkToFirebase() async {
    // final FirebaseUser user = await auth.currentUser();
    // await DatabaseService(uid: user.uid).addBookmark(widget.school.sid);
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final schools = Provider.of<List<School>>(context) ?? [];
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.school.image),
            backgroundColor: Colors.white,
            radius: 25.0,
          ),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: PageView.builder(itemBuilder: (context, index) {
                      return SchoolDetail(
                        school: widget.school,
                      );
                    }),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 200)));
          },
          title: Text(
            widget.school.name,
            style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.04),
          ),
          subtitle: Text("${widget.school.address}",
              style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.038)),
          trailing: RatingBar.builder(
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
          // trailing: IconButton(
          //   icon: isBookmarked ? bookmarkIconComp : bookmarkIconInit,
          //   onPressed:
          //       isBookmarked ? removeBookmarkToFirebase : addBookmarkToFirebase,
          // ),
        ),
      ),
    );
  }
}

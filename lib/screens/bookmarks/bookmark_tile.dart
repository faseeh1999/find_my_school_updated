import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/home/school_detail.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BookmarkTile extends StatefulWidget {
  final School bookmark;
  BookmarkTile({this.bookmark});
  @override
  _BookmarkTileState createState() => _BookmarkTileState();
}

class _BookmarkTileState extends State<BookmarkTile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.bookmark.image),
                backgroundColor: Colors.white,
                radius: 25.0,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: PageView.builder(itemBuilder: (context, index) {
                          return SchoolDetail(
                            school: widget.bookmark,
                          );
                        }),
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: Duration(milliseconds: 200)));
              },
              title: Text(
                widget.bookmark.name,
                style:
                    TextStyle(fontFamily: 'ss', fontSize: size.width * 0.037),
              ),
              subtitle: Text("${widget.bookmark.address}",
                  style: TextStyle(
                      fontFamily: 'ss', fontSize: size.width * 0.038)),
              trailing: RatingBar.builder(
                itemSize: size.width * 0.04,
                initialRating: widget.bookmark.rating,
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
            ),
            Divider(),
            FlatButton.icon(
                onPressed: () async {
                  await DatabaseService(uid: user.uid)
                      .removeBookmark(widget.bookmark)
                      .whenComplete(() => {
                            Fluttertoast.showToast(
                                msg: "Bookmark Removed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0)
                          });
                },
                icon:
                    Icon(Icons.delete_outline_outlined, color: Colors.red[400]),
                label: Text(
                  "Remove From Bookmarks",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ss',
                      fontSize: size.width * 0.04,
                      color: Colors.red[400]),
                ))
          ],
        ),
      ),
    );
  }
}

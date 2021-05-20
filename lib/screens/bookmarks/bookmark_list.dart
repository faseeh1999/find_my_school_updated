import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/bookmarks/bookmark_tile.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkList extends StatefulWidget {
  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List bookmarks = Provider.of<List<School>>(context) ?? [];
    return Column(
      children: [
        Container(
          height: size.height * 0.25,
          width: size.width,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Always Stay",
                      style: TextStyle(
                        fontFamily: 'ss',
                        color: Colors.white,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Updated in Education",
                      style: TextStyle(
                        fontFamily: 'ss',
                        color: Colors.white,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
                size: size.width * 0.2,
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                return BookmarkTile(bookmark: bookmarks[index]);
              }),
        )
      ],
    );
  }
}

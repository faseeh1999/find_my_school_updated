import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/bookmarks/bookmark_list.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<School>>.value(
      value: DatabaseService(uid: user.uid).bookmarks,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Bookmarks",
            style: TextStyle(color: Colors.black, fontFamily: "ss"),
          ),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: BookmarkList(),
      ),
    );
  }
}

// Container(
//         // width: size.width,
//         // height: size.height * 0.3,
//         child: Column(
//           children: [
//             SizedBox(
//               height: size.height * 0.03,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: size.width * 0.4,
//                   child: Card(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: size.height * 0.05,
//                         ),
//                         CircleAvatar(
//                           backgroundColor: Colors.white,
//                         ),
//                         SizedBox(
//                           height: size.height * 0.05,
//                         ),
//                         Text(
//                           "School Name",
//                           style: TextStyle(
//                               fontFamily: 'ss',
//                               fontSize: size.width * 0.05,
//                               fontWeight: FontWeight.normal),
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         RatingBar.builder(
//                           itemSize: size.width * 0.04,
//                           initialRating: 4.0, //widget.school.rating,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.blueAccent,
//                           ),
//                           onRatingUpdate: (rating) {
//                             print(rating);
//                           },
//                         ),
//                         SizedBox(
//                           height: size.height * 0.03,
//                         ),
//                         Text(
//                           "Address",
//                           style: TextStyle(
//                               fontFamily: 'ss',
//                               fontSize: size.width * 0.04,
//                               fontWeight: FontWeight.normal),
//                         ),
//                         SizedBox(
//                           height: size.height * 0.03,
//                         ),
//                       ],
//                     ),
//                     //color: Colors.blueAccent,
//                   ),
//                 ),
//                 Container(
//                   width: size.width * 0.4,
//                   child: Card(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: size.height * 0.05,
//                         ),
//                         CircleAvatar(
//                           backgroundColor: Colors.white,
//                         ),
//                         SizedBox(
//                           height: size.height * 0.05,
//                         ),
//                         Text(
//                           "School Name",
//                           style: TextStyle(
//                               fontFamily: 'ss',
//                               fontSize: size.width * 0.05,
//                               fontWeight: FontWeight.normal),
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         RatingBar.builder(
//                           itemSize: size.width * 0.04,
//                           initialRating: 4.0, //widget.school.rating,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.blueAccent,
//                           ),
//                           onRatingUpdate: (rating) {
//                             print(rating);
//                           },
//                         ),
//                         SizedBox(
//                           height: size.height * 0.03,
//                         ),
//                         Text(
//                           "Address",
//                           style: TextStyle(
//                               fontFamily: 'ss',
//                               fontSize: size.width * 0.04,
//                               fontWeight: FontWeight.normal),
//                         ),
//                         SizedBox(
//                           height: size.height * 0.03,
//                         ),
//                       ],
//                     ),
//                     //color: Colors.blueAccent,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),

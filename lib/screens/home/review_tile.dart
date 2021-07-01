import 'package:find_my_school_updated/models/review.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewTile extends StatefulWidget {
  final Review review;
  ReviewTile({this.review});

  @override
  _ReviewTileState createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: ListTile(
        leading: Icon(Icons.person_outline_outlined),
        title: Text(
          widget.review.name,
          style: TextStyle(
              fontFamily: 'ss',
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.review.description,
          style: TextStyle(
              fontFamily: 'ss',
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.normal),
        ),
        trailing: Text(
          widget.review.rating.toString(),
          style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.03),
        ),
      ),
    );
  }
}

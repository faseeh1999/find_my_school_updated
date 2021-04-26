import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/school_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolList extends StatefulWidget {
  @override
  _SchoolListState createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  @override
  Widget build(BuildContext context) {
    final schools = Provider.of<List<School>>(context) ?? [];

    return ListView.builder(
        itemCount: schools.length,
        itemBuilder: (context, index) {
          return SchoolTile(school: schools[index]);
        });
  }
}

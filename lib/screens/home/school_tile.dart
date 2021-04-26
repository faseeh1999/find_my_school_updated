import 'package:find_my_school_updated/models/school.dart';
import 'package:flutter/material.dart';

class SchoolTile extends StatelessWidget {
  final School school;
  SchoolTile({this.school});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            //backgroundImage: AssetImage('assets/coffee_icon.png'),
            backgroundColor: Colors.blueAccent,
            radius: 25.0,
          ),
          title: Text(
            school.name,
            style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.045),
          ),
          subtitle: Text("${school.address}",
              style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.038)),
        ),
      ),
    );
  }
}

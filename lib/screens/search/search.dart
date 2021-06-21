import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/school_detail.dart';
import 'package:find_my_school_updated/services/search.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String searchString;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  searchString = val.toLowerCase();
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding: const EdgeInsets.only(left: 25.0),
                  hintText: "Search By Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: size.height*0.02),
          Padding(
            padding:  EdgeInsets.all(size.width*0.02),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(onPressed: null, icon: Icon(Icons.category), label: Text("Category")),
                  FlatButton.icon(onPressed: null, icon:  Icon(Icons.ac_unit), label: Text("Sector")),
                  FlatButton.icon(onPressed: null, icon:  Icon(Icons.access_alarm_sharp), label: Text("City")),
                  FlatButton.icon(onPressed: null, icon:  Icon(Icons.access_alarm_sharp), label: Text("City")),
                  FlatButton.icon(onPressed: null, icon:  Icon(Icons.access_alarm_sharp), label: Text("City")),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height*0.02),
          Divider(
            indent: size.width*0.1,
            endIndent: size.width*0.1,
            thickness: size.height * 0.001,
            color: primaryColor,

          ),
          SizedBox(height: size.height*0.02),
          Text("Some of The Best Schools are:", style: GoogleFonts.poppins(
            fontSize: size.width*0.05,
            fontWeight: FontWeight.w400,
            color: primaryColorDark
          ),
            ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                (searchString == null || searchString.trim() == "")
                    ?
                Firestore.instance.collection('requests').snapshots():
                Firestore.instance.collection('requests').where("searchIndex",arrayContains: searchString).snapshots(),

                builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Text("Error: ${snapshot.error}");
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                        break;
                      default:
                        return new ListView(
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            return new Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Card(
                                color: Colors.white,
                                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(document['bg']),
                                    backgroundColor: Colors.white,
                                    radius: 25.0,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: PageView.builder(itemBuilder: (context, index) {
                                              School  school = new School(

                                                curriculum: document['curriculum'],
                                                feedetails: document['feedetails'],
                                                lowerfeerange: document['lowerfeerange'],
                                                upperfeerange: document['upperfeerange'],
                                                openingtiming: document['openingtiming'],
                                                webUrl: document['webUrl'],
                                                city: document['city'],
                                                province: document['province'],
                                                normaltiming: document['normaltiming'],
                                                fridaytiming: document['fridaytiming'],
                                                category: document['category'],
                                                sector: document['sector'],
                                                name: document['name'],
                                                address: document['address'],
                                                contact: document['contact'],
                                                image: document['image'],
                                                bg: document['bg'],
                                                rating: document['rating'],


                                              );
                                              return SchoolDetail(
                                                school: school,
                                              );
                                            }),
                                            type: PageTransitionType.rightToLeftWithFade,
                                            duration: Duration(milliseconds: 200)));
                                  },
                                  title: Text(
                                    document['name'],
                                    style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.04),
                                  ),
                                  subtitle: Text("${document['address']}",
                                      style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.038)),
                                  trailing: RatingBar.builder(
                                    ignoreGestures: true,
                                    itemSize: size.width * 0.04,
                                    initialRating: document['rating'],
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
                          }).toList(),
                        );
                    }
                },
              )


          ),
        ],
      ),



    );
  }

  Widget builResultCard(e) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
        child: Center(
          child: Text(
            e['name'],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

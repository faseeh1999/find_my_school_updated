import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/school_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';

class SearchResultsCategory extends StatefulWidget {
  final String category;
  SearchResultsCategory({this.category});
  @override
  _SearchResultsCategoryState createState() => _SearchResultsCategoryState();
}

class _SearchResultsCategoryState extends State<SearchResultsCategory> {
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
          "Search Results",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
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
                  hintText: "Filter Results",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            "Schools According to ${widget.category}",
            style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                letterSpacing: 1.0),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: (widget.category == null || widget.category.trim() == "")
                ? Firestore.instance.collection('requests').snapshots()
                : Firestore.instance
                    .collection('requests')
                    .where("category", isEqualTo: widget.category)
                    .where("searchIndex", arrayContains: searchString)
                    .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
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
                                      child: PageView.builder(
                                          itemBuilder: (context, index) {
                                        School school = new School(
                                          curriculum: document['curriculum'],
                                          feedetails: document['feedetails'],
                                          lowerfeerange:
                                              document['lowerfeerange'],
                                          upperfeerange:
                                              document['upperfeerange'],
                                          openingtiming:
                                              document['openingtiming'],
                                          webUrl: document['webUrl'],
                                          city: document['city'],
                                          province: document['province'],
                                          normaltiming:
                                              document['normaltiming'],
                                          fridaytiming:
                                              document['fridaytiming'],
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
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(milliseconds: 200)));
                            },
                            title: Text(
                              document['name'],
                              style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.04),
                            ),
                            subtitle: Text("${document['address']}",
                                style: TextStyle(
                                    fontFamily: 'ss',
                                    fontSize: size.width * 0.038)),
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
          )),
        ],
      ),
    );
  }
}

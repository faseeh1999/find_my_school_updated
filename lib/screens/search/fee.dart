import 'package:find_my_school_updated/screens/search/resultFee.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Fee extends StatefulWidget {
  @override
  _FeeState createState() => _FeeState();
}

class _FeeState extends State<Fee> {
  List lowerFee = [1000, 1500, 2000, 2500, 2700, 3000];
  List upperFee = [
    3500,
    4000,
    5000,
    6000,
    7000,
    8000,
    9000,
    10000,
    12000,
    15000,
    20000
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Fee Search",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              color: primaryColor,
              child: Center(
                child: Text(
                  "Search using Fee Range",
                  style: TextStyle(
                    fontFamily: 'ss',
                    color: Colors.white,
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: Text(
                "Lower Fee Range",
                style: TextStyle(
                    fontFamily: 'ss',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: GridView.count(
                padding: EdgeInsets.all(size.width * 0.05),
                shrinkWrap: false,

                // crossAxisSpacing: size.width * .01,
                crossAxisSpacing: 20,
                mainAxisSpacing: 0,
                //mainAxisSpacing: size.height * 0.01,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(lowerFee.length, (index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColorDark,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      //color: primaryColorDark,
                      height: size.height * 0.1,
                      width: size.width * 0.5,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: SearchResultsFee(
                                      fee: lowerFee[index],
                                    ),
                                    type: PageTransitionType.fade));
                          },
                          child: Text(
                            lowerFee[index].toString(),
                            style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: size.width * 0.06,
                                color: Colors.white),
                          )),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: Text(
                "Higher Fee Range",
                style: TextStyle(
                    fontFamily: 'ss',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: GridView.count(
                padding: EdgeInsets.all(size.width * 0.05),
                shrinkWrap: false,

                // crossAxisSpacing: size.width * .01,
                crossAxisSpacing: 20,
                mainAxisSpacing: 0,
                //mainAxisSpacing: size.height * 0.01,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(upperFee.length, (index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColorDark,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      //color: primaryColorDark,
                      height: size.height * 0.1,
                      width: size.width * 0.5,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: SearchResultsFee(
                                      fee: upperFee[index],
                                    ),
                                    type: PageTransitionType.fade));
                          },
                          child: Text(
                            upperFee[index].toString(),
                            style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: size.width * 0.06,
                                color: Colors.white),
                          )),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

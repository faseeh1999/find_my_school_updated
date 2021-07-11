import 'package:find_my_school_updated/screens/search/resultFee.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Fee extends StatefulWidget {
  @override
  _FeeState createState() => _FeeState();
}

class _FeeState extends State<Fee> {
  List lowerFee = [
    500,
    1500,
    2500,
    3500,
    5000,
    7000,
    9000,
    11000,
    13000,
    16000
  ];
  List upperFee = [
    1000,
    2000,
    3000,
    4000,
    6000,
    8000,
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
                "Choose Starting Fee Range",
                style: TextStyle(
                    fontFamily: 'ss',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: upperFee.length,
                padding: EdgeInsets.all(size.width * 0.05),
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.035),
                      child: Container(
                        decoration: BoxDecoration(
                            color: primaryColorDark,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        //color: primaryColorDark,
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: SearchResultsFee(
                                        lowerfee: lowerFee[index],
                                        upperfee: upperFee[index],
                                      ),
                                      type: PageTransitionType.fade));
                            },
                            child: Text(
                              "RS:  " +
                                  lowerFee[index].toString() +
                                  " - " +
                                  upperFee[index].toString(),
                              style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.06,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  );
                },
                // // crossAxisSpacing: size.width * .01,
                // crossAxisSpacing: 20,
                // mainAxisSpacing: 0,
                // //mainAxisSpacing: size.height * 0.01,
                // // Create a grid with 2 columns. If you change the scrollDirection to
                // // horizontal, this produces 2 rows.
                // crossAxisCount: 4,
                // Generate 100 widgets that display their index in the List.
                //children: List.generate(lowerFee.length, (index) {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

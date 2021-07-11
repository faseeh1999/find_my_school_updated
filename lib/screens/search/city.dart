import 'package:find_my_school_updated/screens/search/resultCity.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  List cityList = [
    'Lahore',
    'Karachi',
    'Islamabad',
    'Peshawar',
    'Quetta',
    'Multan',
    'Faisalabad',
    'Sialkot',
    'Gujranwala',
    'Larkana',
    'Hyderabad',
    'Rawalpindi',
    'Abbotabad',
    'Mingora',
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
          "City Search",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              color: primaryColor,
              child: Center(
                child: Text(
                  "Search using Cities",
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
            SizedBox(
              height: size.height * 1,
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
                children: List.generate(cityList.length, (index) {
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
                                    child: SearchResultsCity(
                                      city: cityList[index].toString(),
                                    ),
                                    type: PageTransitionType.fade));
                          },
                          child: Text(
                            cityList[index],
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
            SizedBox(
              height: size.height * 0.04,
            ),
            // Center(
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: primaryColorDark,
            //         border: Border.all(color: Colors.white),
            //         borderRadius: BorderRadius.circular(10)),
            //     //color: primaryColorDark,
            //     height: size.height * 0.1,
            //     width: size.width * 0.7,
            //     child: FlatButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               PageTransition(
            //                   child: SearchResultsCity(
            //                     city: cityList[cityList.length - 1].toString(),
            //                   ),
            //                   type: PageTransitionType.fade));
            //         },
            //         child: Text(
            //           cityList[cityList.length - 1],
            //           style: TextStyle(
            //               fontFamily: 'ss',
            //               fontSize: size.width * 0.06,
            //               color: Colors.white),
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "About Us",
          style: TextStyle(fontFamily: 'ss', color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Text(
                      "A Word About Us",
                      style: TextStyle(
                        fontFamily: 'ss',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      height: size.height * 0.6,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Introduction",
                                style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontFamily: 'ss',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.01),
                              IntroText,
                              SizedBox(height: size.height * 0.01),
                              Text(
                                "Working",
                                style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontFamily: 'ss',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.01),
                              WorkingText,
                              SizedBox(height: size.height * 0.01),
                              Text(
                                "Walkthrough",
                                style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontFamily: 'ss',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.01),
                              WalkthroughText
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

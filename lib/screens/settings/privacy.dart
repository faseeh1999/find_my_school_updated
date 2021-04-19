import 'package:find_my_school_updated/screens/settings/contact.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Privacy Policy",
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
                      "We won't sell your data ever.",
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
                      height: size.height * 0.65,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            PrivacyText,
                            SizedBox(height: size.height * 0.03),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: ContactUs(),
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300)));
                              },
                              child: Text(
                                "Do you have any Questions?",
                                style: LinkTextStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

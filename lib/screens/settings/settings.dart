import 'package:find_my_school_updated/screens/settings/about.dart';
import 'package:find_my_school_updated/screens/settings/account.dart';
import 'package:find_my_school_updated/screens/settings/changePassword.dart';
import 'package:find_my_school_updated/screens/settings/contact.dart';
import 'package:find_my_school_updated/screens/settings/privacy.dart';
import 'package:find_my_school_updated/screens/settings/registerSchool.dart';
import 'package:find_my_school_updated/screens/settings/terms.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:find_my_school_updated/shared/drawer.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';

class SettingsScreen extends StatelessWidget {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Find All",
                          style: TextStyle(
                            fontFamily: 'ss',
                            color: Colors.white,
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "What you need",
                          style: TextStyle(
                            fontFamily: 'ss',
                            color: Colors.white,
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: size.width * 0.2,
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: AccountScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Account",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ChangePassword(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Change Password",
                            style: TextStyle(fontFamily: 'ss', fontSize: 16),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: TermsScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(fontFamily: 'ss', fontSize: 16),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ContactUs(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Contact Us",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: AboutScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("About Us",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: PrivacyScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Privacy Policy",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: RegisterSchool(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Register a School",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Widget logoutButton = FlatButton(
                          child: Text("Logout"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await _auth.signOut();
                          },
                        );

                        Widget cancelButton = FlatButton(
                          child: Text("No"),
                          onPressed: () => Navigator.pop(context),
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Are you sure you want to Logout?"),
                          actions: [
                            cancelButton,
                            logoutButton,
                          ],
                        );
                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },

                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Logout",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

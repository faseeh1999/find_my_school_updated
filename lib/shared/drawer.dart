import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/screens/settings/about.dart';
import 'package:find_my_school_updated/screens/settings/account.dart';
import 'package:find_my_school_updated/screens/settings/privacy.dart';
import 'package:find_my_school_updated/screens/settings/terms.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/loader.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final size = MediaQuery.of(context).size;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              width: size.width * 0.62,
              child: Drawer(
                elevation: 16,
                child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/menubg.png',
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.17),
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.white,
                              size: 70.0,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          Text(
                            userData.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ss',
                                fontSize: size.width * 0.065,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            userData.email,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ss',
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton.icon(
                                      label: Text("About Us",
                                          style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.045,
                                          )),
                                      icon: Icon(
                                          Icons.insert_drive_file_outlined),
                                      elevation: 0.0,
                                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: AboutScreen()),
                                        );
                                      },
                                      textColor: Colors.white,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton.icon(
                                      label: Text("Terms",
                                          style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.045,
                                          )),
                                      icon: Icon(Icons.text_format_sharp),
                                      elevation: 0.0,
                                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: TermsScreen()),
                                        );
                                      },
                                      textColor: Colors.white,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton.icon(
                                      label: Text("Privacy Policy",
                                          style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.045,
                                          )),
                                      icon: Icon(Icons.policy_outlined),
                                      elevation: 0.0,
                                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: PrivacyScreen()),
                                        );
                                      },
                                      textColor: Colors.white,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton.icon(
                                      label: Text("About Us",
                                          style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.045,
                                          )),
                                      icon: Icon(Icons.info_outline),
                                      elevation: 0.0,
                                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: AboutScreen()),
                                        );
                                      },
                                      textColor: Colors.white,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton.icon(
                                      label: Text("Logout",
                                          style: TextStyle(
                                            fontFamily: 'ss',
                                            fontSize: size.width * 0.045,
                                          )),
                                      icon: Icon(Icons.login_outlined),
                                      elevation: 0.0,
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
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        );

                                        // set up the AlertDialog
                                        AlertDialog alert = AlertDialog(
                                          title: Text("Confirm Logout"),
                                          content: Text(
                                              "Are you sure you want to Logout?"),
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
                                      textColor: Colors.white,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

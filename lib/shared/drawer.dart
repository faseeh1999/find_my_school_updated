import 'package:find_my_school_updated/screens/bookmarks/bookmarks.dart';
import 'package:find_my_school_updated/screens/home/home.dart';
import 'package:find_my_school_updated/screens/notification/notifications.dart';
import 'package:find_my_school_updated/screens/search/search.dart';
import 'package:find_my_school_updated/screens/settings/settings.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainDrawer extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
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
                  "M.Faseeh",
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
                  "Email",
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
                        padding: EdgeInsets.only(left: size.width * 0.1),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton.icon(
                            label: Text("Home",
                                style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.045,
                                )),
                            icon: Icon(Icons.add_location_alt_outlined),
                            elevation: 0.0,
                            //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    child: HomeScreen()),
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
                        padding: EdgeInsets.only(left: size.width * 0.1),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton.icon(
                            label: Text("Search",
                                style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.045,
                                )),
                            icon: Icon(Icons.search),
                            elevation: 0.0,
                            //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    child: SearchScreen()),
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
                        padding: EdgeInsets.only(left: size.width * 0.1),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton.icon(
                            label: Text("Bookmarks",
                                style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.045,
                                )),
                            icon: Icon(Icons.star_border_outlined),
                            elevation: 0.0,
                            //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    child: BookmarksScreen()),
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
                        padding: EdgeInsets.only(left: size.width * 0.1),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton.icon(
                            label: Text("Notifications",
                                style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.045,
                                )),
                            icon: Icon(Icons.notifications_none_outlined),
                            elevation: 0.0,
                            //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    child: NotificationScreen()),
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
                        padding: EdgeInsets.only(left: size.width * 0.1),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton.icon(
                            label: Text("Settings",
                                style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: size.width * 0.045,
                                )),
                            icon: Icon(Icons.settings),
                            elevation: 0.0,
                            //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    child: SettingsScreen()),
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
                        padding: EdgeInsets.only(left: size.width * 0.1),
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
                                content:
                                    Text("Are you sure you want to Logout?"),
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
    );
  }
}

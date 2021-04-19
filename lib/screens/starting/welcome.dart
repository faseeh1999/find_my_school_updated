import 'package:find_my_school_updated/screens/authenticate/wrapper.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/welcome.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),

        //color: primaryColor,
        // decoration: new BoxDecoration(
        //   borderRadius: new BorderRadius.circular(16.0),
        //   color: Colors.green,
        // ),

        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "Welcome To",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'ss',
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  "Find My School",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'ss',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: height * 0.64,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            child: Wrapper()));
                  },
                  child: Text(
                    "Let's Get Started",
                    style: ButtonTextStyle,
                  ),
                  elevation: 2.0,
                  highlightElevation: 8.0,
                  color: primaryColor,
                  textColor: Colors.white,
                  splashColor: Colors.blue[200],
                  hoverElevation: 8.0,
                  hoverColor: Colors.green,
                  padding: EdgeInsets.only(
                      left: 35.0, right: 35.0, top: 10.0, bottom: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         PageTransition(
                //             type: PageTransitionType.fade,
                //             duration: Duration(milliseconds: 300),
                //             child: LoginScreen()));
                //   },
                //   child: Text(
                //     "Already Have an Account?",
                //     style: LinkTextStyle,
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

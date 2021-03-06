import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:find_my_school_updated/screens/authenticate/wrapper.dart';
import 'package:find_my_school_updated/screens/starting/introduction.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(context,
          PageTransition(child: Wrapper(), type: PageTransitionType.fade));
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(context,
          PageTransition(child: Introduction(), type: PageTransitionType.fade));
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 2800), () {
      checkFirstSeen();
      // Navigator.pushReplacement(
      //     context,
      //     PageTransition(
      //         type: PageTransitionType.fade,
      //         duration: Duration(milliseconds: 300),
      //         child: Introduction()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 450.0),
              child: Center(
                child: TextLiquidFill(
                    loadDuration: Duration(seconds: 2),
                    textAlign: TextAlign.center,
                    text: 'Find My School',
                    waveColor: Colors.blue[700],
                    boxBackgroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontFamily: 'ss',
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

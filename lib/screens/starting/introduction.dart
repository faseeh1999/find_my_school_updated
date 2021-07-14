import 'package:find_my_school_updated/screens/starting/welcome.dart';

import 'package:find_my_school_updated/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  // Future checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool _seen = (prefs.getBool('seen') ?? false);

  //   if (_seen) {
  //     Navigator.pushReplacement(context,
  //         PageTransition(child: Wrapper(), type: PageTransitionType.fade));
  //   } else {
  //     await prefs.setBool('seen', true);
  //     Navigator.pushReplacement(context,
  //         PageTransition(child: Introduction(), type: PageTransitionType.fade));
  //   }
  // }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset('assets/images/is1.png'),
          title: "Find the best Schools",
          body:
              "Enable Yourself to find the best possible school in all over Your Locality with your smartphone using this new app.",
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'ss', fontWeight: FontWeight.bold, fontSize: 25),
            bodyTextStyle: TextStyle(fontFamily: 'ss'),
          )),
      PageViewModel(
          image: Image.asset('assets/images/is2.png'),
          title: "Acquire all the information needed.",
          body:
              "Find all the relevent information about each school listed, along with details, timings and much more.",
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'ss', fontWeight: FontWeight.bold, fontSize: 25),
            bodyTextStyle: TextStyle(fontFamily: 'ss'),
          )),
      PageViewModel(
          image: Image.asset('assets/images/is3.png'),
          title: "Locate Schools Easily",
          body:
              "No more wasting asking for the location of the school and get the exact location & address for each school listed.",
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'ss', fontWeight: FontWeight.bold, fontSize: 25),
            bodyTextStyle: TextStyle(fontFamily: 'ss'),
          ))
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: IntroductionScreen(
            done: Text(
              "Get Started",
              style: TextStyle(fontFamily: 'ss', fontSize: 16),
            ),
            onDone: () {
              // Within the `FirstRoute` widget

              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      child: WelcomeScreen()));
            },
            pages: getPages(),
            showSkipButton: true,
            skip: Text(
              "Skip",
              style: TextStyle(fontFamily: 'ss', fontSize: 18),
            ),
            showNextButton: true,
            next: const Text(
              "Next",
              style: TextStyle(fontFamily: 'ss', fontSize: 18),
            ),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: primaryColor,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            )),
      ),
    );
  }
}

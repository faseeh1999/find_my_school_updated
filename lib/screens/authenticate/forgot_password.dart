import 'package:find_my_school_updated/screens/authenticate/wrapper.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //Reference to Authentication Object
  final AuthService _auth = AuthService();
  //Global Form Key
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  //Text Field Controllers
  final TextEditingController _email = TextEditingController();

  // Email  Validation

  final validateEmail = ValidationBuilder()
      .required("This Field is Required")
      .email()
      .maxLength(50)
      .build();

  // Form Validation State Function
  bool _validate() {
    return _form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200].withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock,
                  color: iconColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Text(
                "Forgot Your Password?",
                style: TextStyle(
                    fontFamily: 'ss', fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Enter your email address below.",
                style: TextStyle(
                    fontFamily: 'ss', fontSize: 15, color: Colors.black),
              ),
              //We'll send you a link to reset your Password.
              Text(
                "We'll send you a link to reset your Password.",
                style: TextStyle(
                    fontFamily: 'ss', fontSize: 15, color: Colors.black),
              ),

              // Login Form Starts from here.
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmail,
                        decoration: InputDecoration(
                            labelText: "Email", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.04),
                      SizedBox(height: size.height * 0.04),
                      RaisedButton.icon(
                        elevation: 3.0,
                        onPressed: () {
                          if (_validate() == true) {
                            _auth.sendResetPasswordEmail(_email.text);

                            Widget okButton = FlatButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 500),
                                        child: Wrapper()),
                                    (route) => false);
                              },
                            );

                            // set up the AlertDialog
                            AlertDialog alert = AlertDialog(
                              title: Text("Link Sent"),
                              content: Text(
                                  "A Password reset link has been sent to your email."),
                              actions: [
                                okButton,
                              ],
                            );
                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0))),
                        label: Text(
                          'Reset Password',
                          style: ButtonTextStyle,
                        ),
                        icon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.blueAccent,
                        color: buttonColor,
                        padding: EdgeInsets.only(
                            left: 35.0, right: 35.0, top: 10.0, bottom: 10.0),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(height: size.height * 0.03),
                      Divider(
                        color: Colors.grey[800],
                      ),
                      SizedBox(height: size.height * 0.05),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 500),
                                    child: Wrapper()),
                                (route) => false);
                          },
                          child: Text(
                            "Go to Login Page",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ss',
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

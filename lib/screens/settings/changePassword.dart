import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<Null> changePassword(String newPassword) async {
  //   const String API_KEY = 'YOUR_API_KEY';
  //   final String changePasswordUrl =
  //       'https://www.googleapis.com/identitytoolkit/v3/relyingparty/setAccountInfo?key=$API_KEY';
  //
  //   final String idToken = await _auth. // where user is FirebaseUser user
  //
  //   final Map<String, dynamic> payload = {
  //     'email': idToken,
  //     'password': newPassword,
  //     'returnSecureToken': true
  //   };
  //
  //   await http.post(changePasswordUrl,
  //     body: json.encode(payload),
  //     headers: {'Content-Type': 'application/json'},
  //   );
  // }
  //
  //

  bool _validate() {
    return _form.currentState.validate();
  }

  bool _obscureOldPass = true;

  void _toggleOldPass() {
    setState(() {
      _obscureOldPass = !_obscureOldPass;
    });
  }

  bool _obscureNewPass = true;

  void _toggleNewPass() {
    setState(() {
      _obscureNewPass = !_obscureNewPass;
    });
  }

  bool _obscureConfirmPass = true;

  void _toggleConfirmPass() {
    setState(() {
      _obscureConfirmPass = !_obscureConfirmPass;
    });
  }

  final validateOldPass =
      ValidationBuilder().required().minLength(6).maxLength(20).build();

  final validateNewPass =
      ValidationBuilder().required().minLength(6).maxLength(20).build();

  //= ValidationBuilder().test(_newPassword.text);

  // Password Reset Function

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  Future SendresetPasswordEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
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
                  Icons.vpn_key_outlined,
                  color: iconColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Text(
                "Change Your Password?",
                style: TextStyle(
                    fontFamily: 'ss', fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Enter your old password below.",
                style: TextStyle(
                    fontFamily: 'ss', fontSize: 15, color: Colors.black),
              ),
              //We'll send you a link to reset your Password.
              Text(
                "Enter new password and confirm Password.",
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
                        controller: _oldPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateOldPass,
                        obscureText: _obscureOldPass,
                        decoration: InputDecoration(
                            labelText: "Old Password",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: _toggleOldPass,
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        controller: _newPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateNewPass,
                        obscureText: _obscureNewPass,
                        decoration: InputDecoration(
                            labelText: "New Password",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: _toggleNewPass,
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        controller: _confirmNewPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "This field is required.";
                          } else if (val != _newPassword.text) {
                            return "Password doesn't match";
                          }
                          return null;
                        },
                        obscureText: _obscureConfirmPass,
                        decoration: InputDecoration(
                            labelText: "Confirm New Password",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: _toggleConfirmPass,
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.06),
                      RaisedButton.icon(
                        elevation: 3.0,
                        onPressed: () {
                          if (_validate() == true) {
                            SendresetPasswordEmail(_oldPassword.text);

                            Widget okButton = FlatButton(
                              child: Text("OK"),
                              onPressed: () {
                                // Navigator.pushAndRemoveUntil(context,
                                //
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         duration: Duration(milliseconds: 500),
                                //         child: LoginScreen())
                                //
                                //
                                //     , (route) => false);
                              },
                            );

                            // set up the AlertDialog
                            AlertDialog alert = AlertDialog(
                              title: Text("Confirm"),
                              content: Text(
                                  "Are you sure you want to change password?"),
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
                          'Change Password',
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

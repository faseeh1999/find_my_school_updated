import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/loader.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool isLoading = false;

  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();
  final AuthService _auth = AuthService();

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
  bool checkCurrentPassowrd = true;

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return isLoading
                ? Loading()
                : Scaffold(
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
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200].withOpacity(0.8),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
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
                            height: size.height * 0.1,
                          ),
                          Text(
                            "Change Your Password?",
                            style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "We'll send you a link to change your Password.",
                            style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          //We'll send you a link to reset your Password.
                          Text(
                            "At the following Email.",
                            style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: 15,
                                color: Colors.black),
                          ),

                          // Login Form Starts from here.
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Form(
                              key: _form,
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.05),
                                  TextFormField(
                                    initialValue: userData.email,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        labelText: "User Email",
                                        border: OutlineInputBorder()),
                                  ),

                                  // TextFormField(
                                  //   controller: _newPassword,
                                  //   autovalidateMode: AutovalidateMode.disabled,
                                  //   validator: validateNewPass,
                                  //   obscureText: _obscureNewPass,
                                  //   decoration: InputDecoration(
                                  //       labelText: "New Password",
                                  //       suffixIcon: IconButton(
                                  //         icon: Icon(Icons.remove_red_eye),
                                  //         onPressed: _toggleNewPass,
                                  //       ),
                                  //       border: OutlineInputBorder()),
                                  // ),
                                  // SizedBox(height: size.height * 0.02),
                                  // TextFormField(
                                  //   controller: _confirmNewPassword,
                                  //   autovalidateMode: AutovalidateMode.disabled,
                                  //   validator: (String val) {
                                  //     if (val.isEmpty) {
                                  //       return "This field is required.";
                                  //     } else if (val != _newPassword.text) {
                                  //       return "Password doesn't match";
                                  //     }
                                  //     return null;
                                  //   },
                                  //   obscureText: _obscureConfirmPass,
                                  //   decoration: InputDecoration(
                                  //       labelText: "Confirm New Password",
                                  //       suffixIcon: IconButton(
                                  //         icon: Icon(Icons.remove_red_eye),
                                  //         onPressed: _toggleConfirmPass,
                                  //       ),
                                  //       border: OutlineInputBorder()),
                                  // ),
                                  SizedBox(height: size.height * 0.09),
                                  RaisedButton.icon(
                                    elevation: 3.0,
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await _auth
                                          .sendResetPasswordEmail(
                                              userData.email)
                                          .whenComplete(() {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });
                                      Widget okButton = FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.pop(context);
                                        },
                                      );

                                      //set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        title: Text("Check your Email."),
                                        content: Text(
                                          "Kindly, Check your email and change your password with the provided link.",
                                          style: TextStyle(fontFamily: 'ss'),
                                        ),
                                        actions: [
                                          okButton,
                                        ],
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18.0))),
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
                                        left: 35.0,
                                        right: 35.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          } else {
            return Loading();
          }
        });
  }
}

import 'package:find_my_school_updated/screens/forgot_password.dart';
import 'package:find_my_school_updated/services/auth.dart';
import 'package:find_my_school_updated/shared/loader.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Reference to Authentication Object
  final AuthService _auth = AuthService();
  //Global Form Key
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  //Text Field Controllers
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  // Email & Password Validations
  final validatePassword =
      ValidationBuilder().required().minLength(6).maxLength(20).build();
  final validateEmail = ValidationBuilder()
      .required("This Field is Required")
      .email()
      .maxLength(50)
      .build();

// Obsecure Text Boolean & Toggle Function

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Boolean to cheack Loading State
  bool isLoading = false;

  // Form Validation State Function
  bool _validate() {
    return _form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isLoading
        ? Loading()
        : Scaffold(
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
                    Text(
                      "Login",
                      style: TextStyle(fontFamily: 'ss', fontSize: 20),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
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
                    // Login Form Starts from here.
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Form(
                        key: _form,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: size.height * 0.04),
                            TextFormField(
                              controller: _pass,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validatePassword,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: _toggle,
                                  ),
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(height: size.height * 0.04),
                            RaisedButton.icon(
                              elevation: 3.0,
                              onPressed: () async {
                                if (_validate() == true) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          _email.text, _pass.text);
                                  if (result == null) {
                                    setState(() {
                                      isLoading = false;
                                      //error = "Invalid Credentials";
                                    });
                                  }
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0))),
                              label: Text(
                                'Login With Email',
                                style: ButtonTextStyle,
                              ),
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              splashColor: Colors.blueAccent,
                              color: buttonColor,
                              padding: EdgeInsets.only(left: 35.0, right: 35.0),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              "OR",
                              style:
                                  TextStyle(fontFamily: 'ss', fontSize: 16.0),
                            ),
                            SizedBox(height: size.height * 0.01),
                            RaisedButton.icon(
                              elevation: 3.0,
                              onPressed: () {
                                null;
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0))),
                              label: Text(
                                'Sign Up with Email',
                                style: ButtonTextStyle,
                              ),
                              icon: Icon(Icons.person_add_alt_1_outlined),
                              textColor: Colors.white,
                              splashColor: Colors.blueAccent,
                              color: buttonColor,
                              padding: EdgeInsets.only(left: 35.0, right: 35.0),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Divider(
                              color: Colors.grey[800],
                            ),
                            SizedBox(height: size.height * 0.05),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 500),
                                          child: ForgotPassword()));
                                },
                                child: Text(
                                  "Forgot Your Password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
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

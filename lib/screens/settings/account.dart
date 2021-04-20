import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
// Global Form Key
  GlobalKey<FormState> _form = GlobalKey();

// Function to Validate Form State
  bool _validate() {
    return _form.currentState.validate();
  }

// Form Field Validators

  final validateName = ValidationBuilder().required().maxLength(30).build();
  final validatePhone = ValidationBuilder()
      .required()
      .phone()
      .maxLength(11)
      .minLength(11)
      .build();
  final validateEmail =
      ValidationBuilder().required().email().maxLength(50).build();

// Field Controllers
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Account",
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
                  Icons.person_outline_outlined,
                  color: iconColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Text(
                "Manage Account Info?",
                style: TextStyle(
                    fontFamily: 'ss', fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Enter your Updated Info below",
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
                        controller: _name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateName,
                        decoration: InputDecoration(
                            labelText: "Name", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        controller: _email,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmail,
                        decoration: InputDecoration(
                            labelText: "Email", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        controller: _phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePhone,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.06),
                      RaisedButton.icon(
                        elevation: 3.0,
                        onPressed: () {
                          if (_validate() == true) {
                            // SendresetPasswordEmail(_oldPassword.text);

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
                          'Update Account',
                          style: ButtonTextStyle,
                        ),
                        icon: Icon(
                          Icons.done_all_outlined,
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

import 'package:find_my_school_updated/models/user.dart';
import 'package:find_my_school_updated/services/database.dart';
import 'package:find_my_school_updated/shared/loader.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
// Global Form Key
  GlobalKey<FormState> _form = GlobalKey();

  bool isLoading = false;

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

//Strings for Form Fields
  String name;
  String email;
  String phone;

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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
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
                                  fontFamily: 'ss',
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Enter your Updated Info below",
                              style: TextStyle(
                                  fontFamily: 'ss',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),

                            // Update User Form Starts from here.
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Form(
                                key: _form,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      initialValue: userData.name,
                                      onChanged: (val) {
                                        setState(() {
                                          name = val;
                                        });
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: validateName,
                                      decoration: InputDecoration(
                                          labelText: "Name",
                                          border: OutlineInputBorder()),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    TextFormField(
                                      initialValue: userData.email,
                                      enabled: false,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: validateEmail,
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          border: OutlineInputBorder()),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    TextFormField(
                                      initialValue: userData.phone,
                                      onChanged: (val) {
                                        setState(() {
                                          phone = val;
                                        });
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
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
                                          //Confirm Button
                                          Widget confirmButton = FlatButton(
                                            child: Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                name = "";
                                                email = "";
                                                phone = "";
                                              });
                                              Navigator.pop(context);
                                            },
                                          );
                                          // set up the Ok Dialog
                                          AlertDialog okAlert = AlertDialog(
                                            title: Text("Information Updated"),
                                            content: Text(
                                                "Your New Account Iinfomation has been Updated."),
                                            actions: [
                                              confirmButton,
                                            ],
                                          );
                                          Widget okButton = FlatButton(
                                            child: Text("OK"),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                isLoading = true;
                                              });
                                              await DatabaseService(
                                                      uid: user.uid)
                                                  .updateUserDate(
                                                      name ?? userData.name,
                                                      userData.email,
                                                      phone ?? userData.phone)
                                                  .whenComplete(() => {
                                                        setState(() {
                                                          isLoading = false;
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return okAlert;
                                                            },
                                                          );
                                                        })
                                                      });
                                            },
                                          );

                                          Widget cancelButton = FlatButton(
                                            child: Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                name = "";
                                                email = "";
                                                phone = "";
                                              });
                                            },
                                          );

                                          // set up the AlertDialog to Confrim Changes
                                          AlertDialog confirmAlert =
                                              AlertDialog(
                                            title: Text("Confirm Changes"),
                                            content: Text(
                                                "Are you sure you want to update your account?"),
                                            actions: [
                                              cancelButton,
                                              okButton,
                                            ],
                                          );
                                          // show the dialog
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return confirmAlert;
                                            },
                                          );
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0))),
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
                    ),
                  );
          } else {
            return Loading();
          }
        });
  }
}

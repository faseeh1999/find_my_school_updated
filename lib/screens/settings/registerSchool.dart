import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class RegisterSchool extends StatefulWidget {
  @override
  _RegisterSchoolState createState() => _RegisterSchoolState();
}

class _RegisterSchoolState extends State<RegisterSchool> {
  GlobalKey<FormState> _form = GlobalKey();
  // Function to Validate Form State
  bool _validate() {
    return _form.currentState.validate();
  }
// Form Field Validators

  final validateSchoolName =
      ValidationBuilder().required().maxLength(35).build();
  final validateSchoolPhone = ValidationBuilder()
      .required()
      .phone()
      .maxLength(11)
      .minLength(11)
      .build();
  final validateSchoolEmail =
      ValidationBuilder().required().email().maxLength(50).build();
  final validateSchoolAddress =
      ValidationBuilder().required().maxLength(100).build();
//Strings for Form Fields
  String schoolName;
  String schoolEmail;
  String schoolPhone;
  String schoolCity;
  String schoolProvince;
  String schoolSector;
  String schoolCategory;
  String schoolLocation;
  String schoolCurriculum;
  String schoolfeeDetails;
  int schoolLowerFeeRange;
  int schoolUpperFeeRange;
  String schoolOpeningtiming;
  String schoolNormaltiming;
  String schoolFridaytiming;
  String schoolWebUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Register a School",
          style: TextStyle(color: Colors.black, fontFamily: 'ss'),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
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
                Icons.person_outline_outlined,
                color: iconColor,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "Register a New School",
              style: TextStyle(
                  fontFamily: 'ss', fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Complete the form below",
              style: TextStyle(
                  fontFamily: 'ss', fontSize: 15, color: Colors.black),
            ),

            // Update User Form Starts from here.
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) {
                        setState(() {
                          schoolName = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateSchoolName,
                      decoration: InputDecoration(
                          labelText: "School Name",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateSchoolEmail,
                      decoration: InputDecoration(
                          labelText: "School Email",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      onChanged: (val) {
                        setState(() {
                          schoolPhone = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateSchoolPhone,
                      decoration: InputDecoration(
                          labelText: "School Phone Number",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      onChanged: (val) {
                        setState(() {
                          schoolPhone = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateSchoolPhone,
                      decoration: InputDecoration(
                          labelText: "School Address",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButton<String>(
                              value: schoolCity,
                              hint: Text(
                                "City",
                                style: TextStyle(fontFamily: 'ss'),
                                textAlign: TextAlign.center,
                              ),
                              items: <String>[
                                // 'A', 'B', 'C', 'D'
                                'Lahore',
                                'Karachi',
                                'Islamabad',
                                'Multan',
                                'Peshawar',
                                'Rawalpindi',
                                'Faisalabad',
                                'Quetta',
                                'Gujranwala',
                                'Sargodha',
                                'Sialkot',
                                'Hyderabad',
                                'Sukkur',
                                'Larkana',
                                'Mardan',
                                'Abbottabad',
                                'Kohat'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  schoolCity = value;
                                  print(schoolCity);
                                });
                              },
                            ),
                            DropdownButton<String>(
                              value: schoolProvince,
                              hint: Text("Province"),
                              items: <String>[
                                // 'A', 'B', 'C', 'D'
                                'Punjab',
                                'Sindh',
                                'KPK',
                                'Balochistan',
                                'Azad Kashmir'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  schoolProvince = value;
                                  print(schoolProvince);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButton<String>(
                              focusColor: primaryColor,
                              value: schoolSector,
                              hint: Text("Sector"),
                              items: <String>[
                                // 'A', 'B', 'C', 'D'
                                'Public',
                                'Private',
                                'Semi-Government',
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  schoolSector = value;
                                  print(schoolSector);
                                });
                              },
                            ),
                            DropdownButton<String>(
                              value: schoolCategory,
                              hint: Text("Category"),
                              items: <String>[
                                // 'A', 'B', 'C', 'D'
                                'Matriculation',
                                'O/A Levels',
                                'Matric & O/A Levers',
                                'Madrissa'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  schoolCategory = value;
                                  print(schoolCategory);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        setState(() {
                          schoolPhone = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateSchoolPhone,
                      decoration: InputDecoration(
                          labelText: "School Website or Facebook Page",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
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
                                schoolName = "";
                                schoolEmail = "";
                                schoolPhone = "";
                                schoolCity = "";
                                schoolProvince = "";
                                schoolSector = "";
                                schoolCategory = "";
                                schoolCurriculum = "";
                                schoolfeeDetails = "";
                                schoolFridaytiming = "";
                                schoolOpeningtiming = "";
                                schoolNormaltiming = "";
                                schoolLocation = "";
                                schoolWebUrl = "";
                                schoolLowerFeeRange = 0;
                                schoolUpperFeeRange = 0;
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
                              // Navigator.of(context).pop();
                              // setState(() {
                              //   isLoading = true;
                              // });
                              // await DatabaseService(uid: user.uid)
                              //     .updateUserDate(
                              //         name ?? userData.name,
                              //         email ?? userData.email,
                              //         phone ?? userData.phone)
                              //     .whenComplete(() => {
                              //           setState(() {
                              //             isLoading = false;
                              //             showDialog(
                              //               context: context,
                              //               builder: (BuildContext context) {
                              //                 return okAlert;
                              //               },
                              //             );
                              //           })
                              //         });
                            },
                          );

                          Widget cancelButton = FlatButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                schoolName = "";
                                schoolEmail = "";
                                schoolPhone = "";
                                schoolCity = "";
                                schoolProvince = "";
                                schoolSector = "";
                                schoolCategory = "";
                                schoolCurriculum = "";
                                schoolfeeDetails = "";
                                schoolFridaytiming = "";
                                schoolOpeningtiming = "";
                                schoolNormaltiming = "";
                                schoolLocation = "";
                                schoolWebUrl = "";
                                schoolLowerFeeRange = 0;
                                schoolUpperFeeRange = 0;
                              });
                            },
                          );

                          // set up the AlertDialog to Confrim Changes
                          AlertDialog confirmAlert = AlertDialog(
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
    );
  }
}

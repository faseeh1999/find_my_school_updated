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
  final validateSchoolCity = ValidationBuilder().required();
  final validateCurriculum =
      ValidationBuilder().minLength(50).maxLength(300).required().build();
  final validateFeeDetails =
      ValidationBuilder().minLength(50).maxLength(250).required().build();
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

  List cityList = [
    'Lahore',
    'Karachi',
    'Islamabad',
    'Peshawar',
    'Quetta',
    'Multan',
    'Faisalabad',
    'Sialkot',
    'Gujranwala',
    'Larkana',
    'Hyderabad',
    'Rawalpindi',
    'Abbotabad',
    'Mingora',
    'Mardan'
  ];
  List provinceList = ['Punjab', 'Sindh', 'KPK', 'Balochistan', 'Azad Kashmir'];
  List sectorList = ['Public', 'Private', 'Semi-Government'];
  List categoryList = ['Matriculation', 'O/A Levels', 'Matric & O/A Levels'];
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
                      autovalidateMode: AutovalidateMode.always,
                      validator: (val) =>
                          val == null ? "Enter School Name" : null,
                      onChanged: (val) {
                        setState(() {
                          schoolName = val;
                        });
                      },
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
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Choose City",
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) =>
                                val == null ? "Choose City" : null,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: schoolCity,
                            items: cityList.map((value) {
                              return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'ss'),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                schoolCity = value;
                              });
                            }),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Choose Province",
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) =>
                                val == null ? "Choose Province" : null,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: schoolProvince,
                            items: provinceList.map((value) {
                              return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'ss'),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                schoolProvince = value;
                              });
                            }),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Choose Sector",
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) =>
                                val == null ? "Choose Sector" : null,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: schoolSector,
                            items: sectorList.map((value) {
                              return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'ss'),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                schoolSector = value;
                              });
                            }),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Choose Category",
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) =>
                                val == null ? "Choose Category" : null,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: schoolCategory,
                            items: categoryList.map((value) {
                              return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'ss'),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                schoolCategory = value;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                          labelText: "School Location Google Maps URL",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                          labelText: "School Website or Facebook Page URL",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        schoolCurriculum = val;
                      },
                      keyboardType: TextInputType.text,
                      maxLines: 7,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: validateCurriculum,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "School Curriculum",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        schoolCurriculum = val;
                      },
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: validateFeeDetails,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "School Fee Details",
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
                        'Register School',
                        style: ButtonTextStyle,
                      ),
                      icon: Icon(
                        Icons.add_circle_outline_outlined,
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

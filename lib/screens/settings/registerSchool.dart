import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_validator/form_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:find_my_school_updated/services/database.dart';

class RegisterSchool extends StatefulWidget {
  @override
  _RegisterSchoolState createState() => _RegisterSchoolState();
}

class _RegisterSchoolState extends State<RegisterSchool> {
  GlobalKey<FormState> _form = GlobalKey();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
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
  final validateSchoolAddress =
      ValidationBuilder().required().maxLength(100).build();
  final validateSchoolCity = ValidationBuilder().required();
  final validateCurriculum =
      ValidationBuilder().minLength(50).maxLength(300).required().build();
  final validateFeeDetails =
      ValidationBuilder().minLength(50).maxLength(250).required().build();

  final validateLocation = ValidationBuilder().required().url().build();
  final validateWebURL = ValidationBuilder().required().url().build();
//Strings for Form Fields
  String schoolName;
  String schoolAddress;
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
  String schoolLogo;
  String schoolImage;
  double schoolRating;

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
  List lowerFee = [1000, 1500, 2000, 2500, 2700, 3000];
  List upperFee = [
    3500,
    4000,
    5000,
    6000,
    7000,
    8000,
    9000,
    10000,
    12000,
    15000,
    20000
  ];

  TimeOfDay openTime;
  TimeOfDay closeTime;
  TimeOfDay fridayTime;
  TimeOfDay selectedTime;

  bool timeSelected = false;

  @override
  void initState() {
    super.initState();

    openTime = TimeOfDay.now();
    closeTime = TimeOfDay.now();
    fridayTime = TimeOfDay.now();
  }

  Future<Null> selectOpenTime(BuildContext context) async {
    selectedTime = await showTimePicker(
        context: context, initialTime: new TimeOfDay(hour: 8, minute: 00));
    if (selectedTime != null) {
      setState(() {
        openTime = selectedTime;
        timeSelected = true;
      });
    }
  }

  Future<Null> selectCloseTime(BuildContext context) async {
    setState(() {
      selectedTime = null;
    });
    selectedTime = await showTimePicker(
        context: context, initialTime: new TimeOfDay(hour: 13, minute: 00));
    if (selectedTime != null) {
      setState(() {
        closeTime = selectedTime;
        timeSelected = true;
      });
    }
  }

  Future<Null> selectFridayTime(BuildContext context) async {
    setState(() {
      selectedTime = null;
    });
    selectedTime = await showTimePicker(
        context: context, initialTime: new TimeOfDay(hour: 12, minute: 30));
    if (selectedTime != null) {
      setState(() {
        fridayTime = selectedTime;
        timeSelected = true;
      });
    }
  }

  File _imageLogo;
  File _imageSchool;
  @override
  Widget build(BuildContext context) {
    Future getLogoImage() async {
      var imageLogo = await ImagePicker().getImage(source: ImageSource.gallery);
      setState(() {
        _imageLogo = File(imageLogo.path);
      });
    }

    Future getSchoolImage() async {
      var imageSchool =
          await ImagePicker().getImage(source: ImageSource.gallery);
      setState(() {
        _imageSchool = File(imageSchool.path);
      });
    }

    Future uploadLogoImage(BuildContext context) async {
      String fileName = basename(_imageLogo.path);
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = storageReference.putFile(_imageLogo);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      setState(() {
        print("Logo has been Uploaded");
        storageReference
            .getDownloadURL()
            .then((value) => {schoolLogo = value.toString()});
        print(schoolLogo);
      });
    }

    Future uploadSchoolImage(BuildContext context) async {
      String fileName = basename(_imageSchool.path);
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = storageReference.putFile(_imageSchool);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("School Image has been Uploaded");
        storageReference
            .getDownloadURL()
            .then((value) => {schoolImage = value.toString()});
        //schoolImage = storageReference.getDownloadURL().toString();
        print(schoolImage);
      });
    }

    final localizations = MaterialLocalizations.of(context);

    String formattedOpenTime = localizations.formatTimeOfDay(openTime);
    String formattedCloseTime = localizations.formatTimeOfDay(closeTime);
    String formattedFridayTime = localizations.formatTimeOfDay(fridayTime);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
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
                FontAwesomeIcons.university,
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
                          schoolAddress = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateSchoolAddress,
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
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Choose Lower Fee Range",
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) =>
                                val == null ? "Choose Lower Fee Range" : null,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: schoolLowerFeeRange,
                            items: lowerFee.map((value) {
                              return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'ss'),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                schoolLowerFeeRange = value;
                              });
                            }),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Choose Upper Fee Range",
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) =>
                                val == null ? "Choose Upper Fee Range" : null,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            value: schoolUpperFeeRange,
                            items: upperFee.map((value) {
                              return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(
                                    value.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: 'ss'),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                schoolUpperFeeRange = value;
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
                          schoolLocation = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateLocation,
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
                          schoolWebUrl = val;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateWebURL,
                      decoration: InputDecoration(
                          labelText: "School Website or Facebook Page URL",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlatButton.icon(
                          onPressed: () async {
                            await getLogoImage();
                          },
                          icon: Icon(
                            FontAwesomeIcons.image,
                            color: Colors.black,
                            size: size.width * 0.06,
                          ),
                          label: Text(
                            "Add School Logo",
                            style: TextStyle(
                                fontFamily: 'ss',
                                color: Colors.black,
                                fontSize: size.width * 0.05),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlatButton.icon(
                          onPressed: () async {
                            await getSchoolImage();
                          },
                          icon: Icon(
                            FontAwesomeIcons.image,
                            color: Colors.black,
                            size: size.width * 0.06,
                          ),
                          label: Text(
                            "Add School Picture",
                            style: TextStyle(
                                fontFamily: 'ss',
                                color: Colors.black,
                                fontSize: size.width * 0.05),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    FlatButton.icon(
                      icon: Icon(FontAwesomeIcons.upload),
                      label: Text("Upload Images"),
                      onPressed: () {
                        uploadLogoImage(context).whenComplete(() {
                          _globalKey.currentState.showSnackBar(SnackBar(
                            content: Text("Logo Uploaded"),
                          ));
                        });
                        uploadSchoolImage(context).whenComplete(() {
                          _globalKey.currentState.showSnackBar(SnackBar(
                            content: Text("School Image Uploaded"),
                          ));
                        });
                      },
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
                        schoolfeeDetails = val;
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton.icon(
                              onPressed: () async {
                                await selectOpenTime(context);
                                print(openTime);
                                setState(() {
                                  schoolOpeningtiming = formattedOpenTime;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.clock),
                              label: timeSelected
                                  ? Text(
                                      '$formattedOpenTime',
                                      // 'Time ${openTime.hour} : ${openTime.minute}',
                                      style: TextStyle(
                                          fontFamily: 'ss',
                                          fontSize: size.width * 0.05),
                                    )
                                  : Text(
                                      "Opening Timing",
                                      style: TextStyle(
                                          fontFamily: 'ss',
                                          fontSize: size.width * 0.05),
                                    )),
                          FlatButton.icon(
                              onPressed: () async {
                                await selectCloseTime(context);
                                print(closeTime);
                                setState(() {
                                  schoolNormaltiming = formattedCloseTime;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.clock),
                              label: timeSelected
                                  ? Text(
                                      '$formattedCloseTime',
                                      // 'Time ${openTime.hour} : ${openTime.minute}',
                                      style: TextStyle(
                                          fontFamily: 'ss',
                                          fontSize: size.width * 0.05),
                                    )
                                  : Text(
                                      "Closing Timing",
                                      style: TextStyle(
                                          fontFamily: 'ss',
                                          fontSize: size.width * 0.05),
                                    )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton.icon(
                            onPressed: () async {
                              await selectFridayTime(context);
                              print(fridayTime);
                              setState(() {
                                schoolFridaytiming = formattedFridayTime;
                              });
                            },
                            icon: Icon(FontAwesomeIcons.clock),
                            label: timeSelected
                                ? Text(
                                    '$formattedFridayTime',
                                    // 'Time ${openTime.hour} : ${openTime.minute}',
                                    style: TextStyle(
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.05),
                                  )
                                : Text(
                                    "Friday Timing",
                                    style: TextStyle(
                                        fontFamily: 'ss',
                                        fontSize: size.width * 0.05),
                                  )),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                                schoolImage = "";
                                schoolLogo = "";
                                schoolName = "";
                                schoolAddress = "";
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
                                schoolRating = 4.0;
                              });
                              Navigator.pop(context);
                            },
                          );
                          // set up the Ok Dialog
                          AlertDialog okAlert = AlertDialog(
                            title: Text("Request Received"),
                            content: Text(
                                "Your School will be added to the App, after verificaition from our team."),
                            actions: [
                              confirmButton,
                            ],
                          );
                          Widget okButton = FlatButton(
                            child: Text("OK"),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              // setState(() {
                              //   isLoading = true;
                              // });
                              await DatabaseService()
                                  .addSchoolRequesut(
                                      schoolName,
                                      schoolAddress,
                                      schoolPhone,
                                      schoolCity,
                                      schoolProvince,
                                      schoolSector,
                                      schoolCategory,
                                      schoolLocation,
                                      schoolCurriculum,
                                      schoolfeeDetails,
                                      schoolLowerFeeRange,
                                      schoolUpperFeeRange,
                                      schoolOpeningtiming,
                                      schoolNormaltiming,
                                      schoolFridaytiming,
                                      schoolWebUrl,
                                      schoolLogo,
                                      schoolImage,
                                      schoolRating)
                                  .whenComplete(() => {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return okAlert;
                                            })
                                      });
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
                              // setState(() {
                              //   schoolImage = "";
                              //   schoolLogo = "";
                              //   schoolName = "";
                              //   schoolAddress = "";
                              //   schoolPhone = "";
                              //   schoolCity = "";
                              //   schoolProvince = "";
                              //   schoolSector = "";
                              //   schoolCategory = "";
                              //   schoolCurriculum = "";
                              //   schoolfeeDetails = "";
                              //   schoolFridaytiming = "";
                              //   schoolOpeningtiming = "";
                              //   schoolNormaltiming = "";
                              //   schoolLocation = "";
                              //   schoolWebUrl = "";
                              //   schoolLowerFeeRange = 0;
                              //   schoolUpperFeeRange = 0;
                              //   schoolRating = 4.0;
                              // });
                            },
                          );

                          // set up the AlertDialog to Confrim Changes
                          AlertDialog confirmAlert = AlertDialog(
                            title: Text("Confirm Register"),
                            content: Text(
                                "Are you sure you want to register school with these details?"),
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
                        style: ButtonTextStyle.copyWith(
                            fontSize: size.width * 0.05),
                      ),
                      icon: Icon(
                        FontAwesomeIcons.plusCircle,
                        color: Colors.white,
                        size: size.width * 0.05,
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

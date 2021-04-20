import 'package:find_my_school_updated/services/mail.dart';
import 'package:find_my_school_updated/theme/color.dart';
import 'package:find_my_school_updated/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class ContactUs extends StatelessWidget {
  MailService _mail = MailService();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _message = TextEditingController();

  final validateName = ValidationBuilder().required().build();
  final validateEmail =
      ValidationBuilder().required().email().maxLength(50).build();
  final validateMessage =
      ValidationBuilder().required().minLength(50).maxLength(500).build();

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool _validate() {
    return _form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Contact Us",
          style: TextStyle(fontFamily: 'ss', color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Text(
                      "Send us a Message",
                      style: TextStyle(
                        fontFamily: 'ss',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      height: size.height * 0.8,
                      width: size.width * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: _form,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _name,
                                keyboardType: TextInputType.name,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "This field is required.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Your Name",
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: size.height * 0.04),
                              TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateEmail,
                                decoration: InputDecoration(
                                    labelText: "Your Email",
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: size.height * 0.04),
                              TextFormField(
                                controller: _message,
                                keyboardType: TextInputType.text,
                                maxLines: 7,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateMessage,
                                // validator: (String val) {
                                //   if (val.isEmpty) {
                                //     return "This field is required.";
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Your Message",
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              RaisedButton.icon(
                                elevation: 3.0,
                                onPressed: () async {
                                  if (_validate() == true) {
                                    await _mail.sendMail();
                                    Widget okButton = FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        //Navigator.pop(context);
                                      },
                                    );

                                    // set up the AlertDialog
                                    AlertDialog alert = AlertDialog(
                                      title: Text("Message Sent"),
                                      content: Text(
                                          "Your Message has been sent to administration team, they will contact you back shortly."),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(18.0))),
                                label: Text(
                                  'Send Message',
                                  style: ButtonTextStyle,
                                ),
                                icon: Icon(
                                  Icons.send_outlined,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

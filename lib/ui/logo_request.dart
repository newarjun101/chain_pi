import 'package:chain_pi/Models/logo_request_model.dart';
import 'package:chain_pi/service/firebase_service_for_logo_request.dart';
import 'package:flutter/material.dart';


class LogoRequest extends StatefulWidget {
  final LogoRequestModel logoRequestModel;

  LogoRequest(this.logoRequestModel);

  @override
  _LogoRequestState createState() => _LogoRequestState();
}

class _LogoRequestState extends State<LogoRequest> {
  FirebaseServiceForLogoRequest firebaseServiceForLogoRequest =
      FirebaseServiceForLogoRequest();
  final List<String> _dropdownTotalDays = ['2', '3', '4', '5', '6', '7'];
  TextEditingController _logoNameEditingController;
  TextEditingController _logoColorEditingController;
  TextEditingController _logoDescriptionEditingController;
  String dropdownValue = '3';
  String _nameOfLogo;

  //This is use for validate the textformfiled is wheather Empty or not
  //If Emply we will retun the error message
  final _formKey = GlobalKey<FormState>();

  // To show Selected Item in Text.
  String holder = '';

  @override
  void initState() {
    super.initState();
    _logoNameEditingController =
        TextEditingController(text: widget.logoRequestModel.logoName);
    _logoColorEditingController =
        TextEditingController(text: widget.logoRequestModel.logoColor);
    _logoDescriptionEditingController =
        TextEditingController(text: widget.logoRequestModel.logoDescription);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Logo Request"),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _logoNameEditingController,
                    decoration: InputDecoration(
                      hintText: "Logo Name",
                      errorStyle: TextStyle(
                        color: Colors.red,
                        wordSpacing: 5.0,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Enter name";
                      }
                      return null;
                    },
                    onSaved: (val) => _nameOfLogo = val,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _logoColorEditingController,
                      decoration: InputDecoration(
                        hintText: "Choos Your Color (Optional)",
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: null),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _logoDescriptionEditingController,
                      decoration: InputDecoration(
                        hintText: "Detail about your description",
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: null,
                      validator: (value) {
                        if (value == null || value == '') {
                          return "Plesae Enter Some description";
                        }
                        return null;
                      }),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Please choose Data",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            onChanged: (String data) {
                              setState(() {
                                dropdownValue = data;
                              });
                            },
                            items: _dropdownTotalDays
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Days"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    onPressed: () {
                      getDropDownItem();
                      final form = _formKey.currentState;

                      if (form.validate()) {
                        form.save();

                       if(widget.logoRequestModel.logoName !=null || widget.logoRequestModel.logoName !='' ||
                         widget.logoRequestModel.logoColor !=null || widget.logoRequestModel.logoColor !=''||
                     widget.logoRequestModel.logoDescription !=null || widget.logoRequestModel.logoDescription !=''
                     ) {
                         firebaseServiceForLogoRequest.createLogoRequest(
                             _logoNameEditingController.text,
                             _logoColorEditingController.text,
                             _logoDescriptionEditingController.text,
                             holder.toString());
                       }
                      }
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          32.0,
                        ),
                        side: BorderSide(color: Color(0xFF179CDF))),
                    child: Text(
                      "CONFIRM AND SEND",
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF179CDF)),
                    ),
                  )),
                ],
              ),
            )),
      ),
    );
  }

  // Create a function named as getDropDownItem().
  // In this function we would store the selected item into another variable using State.

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });

  }
}

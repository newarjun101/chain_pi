import 'package:chain_pi/LoginSingUp/login_page.dart';
import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text("Detail Page"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 600),
                      pageBuilder: (_, __, ___) => LoginPage(),
                    )
                );
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("Dialog"),
              onPressed: () {
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "RFLUTTER ALERT",
                  desc: "Alert Dialog with 2 Buttons.",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("Detail Page"),
              onPressed: () {
                showCustomDialogWithImage(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialogWithImage(BuildContext context) {
    Dialog dialogWithImage = Dialog(
      backgroundColor: Colors.white,

       child: Container(
         width: 280,
         height: 300,
         child: Column(
            children: <Widget>[

              Container(

                child: Image.asset(
                  'images/login_page_top_image.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(

                child: Text(
                  "Welcome to Hertz",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      ),
                ),
              ),
              Container(


                child: Text(
                  "Please Choose the User Type",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Text(
                    'Customer',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },

                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Text(
                      'Freelance',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },

                  )
                ],
              ),
            ],
          ),
       ),




    );





    showDialog(
    context: context, builder: (BuildContext
    context
    )
    =>
    dialogWithImage
    );
  }
}


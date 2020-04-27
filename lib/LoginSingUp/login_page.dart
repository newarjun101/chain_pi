import 'package:chain_pi/LoginSingUp/sign_up_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); //check email password valid or not
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
                color: Colors.white,
                child: Image.asset(
                  "images/login_page_top_image.png",
                  height: 150,
                )),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Chain Pi',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25)),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Enter Your Email",
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black38,
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Enter Your Email",
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.black38,
                    )),
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.only(left: 50.0, right: 40.0, top: 20,bottom: 20),
              child: RaisedButton(
                highlightElevation: 20,
                color: Colors.blue,
                splashColor: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Login"),
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
              ),
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),

                Expanded(

                  flex: 1,
                  child: FacebookSignInButton(
                    text: "Facebook",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                //Google Login Button
                Expanded(
                  flex: 1,
                  child: GoogleSignInButton(
                    text: "Google",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
            //Facebook Login Button
            /*Container(
              height: 60,
              padding: EdgeInsets.only(left: 50.0, right: 40.0, top: 10),
              child: FacebookSignInButton(
                text: "Facebook",
                onPressed: () {},
              ),
            ),
            //Google Login Button
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 50.0, right: 40.0, top: 10),
              child: GoogleSignInButton(
                text: "Google",
                onPressed: () {},
              ),
            ),*/
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              //  padding: EdgeInsets.only(left: 50.0, right: 40.0, top: 10),
              child: RichText(
                text: TextSpan(
                    text: "Don't Have Account? ",
                    style: TextStyle(color: Colors.black38),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sing Up ",
                        recognizer: TapGestureRecognizer()
                   ..onTap= () =>  print("Hello World"),
                        style: TextStyle(
                            color: Colors.blue,
                            // decoration: TextDecoration.underline,
                            fontSize: 20),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

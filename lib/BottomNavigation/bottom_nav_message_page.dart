import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BottomNavMessagePage extends StatefulWidget {
  @override
  _BottomNavMessagePageState createState() => _BottomNavMessagePageState();
}

class _BottomNavMessagePageState extends State<BottomNavMessagePage> {
  final databaseRefrence = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"),
            Text("Give More"),
            Text("Give More"),
            RaisedButton(
              child: Text("Get Data"),
              onPressed: (){
                getData();

              },
            )

          ],
        ),
      )
    );
  }
  void getData(){

    databaseRefrence.collection("programmer")
        .getDocuments()
        .then((QuerySnapshot snapshot){

      snapshot.documents.forEach((f) => print('${f.data}}'));

    });

  }
}

import 'dart:async';
import 'package:chain_pi/Models/note.dart';
import 'package:chain_pi/service/firebase_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'note_screen.dart';

class ListViewNote extends StatefulWidget {
  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}

class _ListViewNoteState extends State<ListViewNote> {
  List<Note> items;
  FirebaseFirestoreService db = new FirebaseFirestoreService();

  StreamSubscription<QuerySnapshot> noteSub;

  @override
  void initState() {
    super.initState();

    items = new List();

    noteSub?.cancel();
    noteSub = db.getNoteList().listen((QuerySnapshot snapshot) {
      final List<Note> notes = snapshot.documents
          .map((documentSnapshot) => Note.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        this.items = notes;
      });
    });
  }

  @override
  void dispose() {
    noteSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'grokonez Firestore Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('grokonez Firestore Demo'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].title}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].description}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10.0)),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15.0,
                            child: Text(
                              '${position + 1}',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          ],
                      ),
                      onTap: () => _navigateToNote(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewNote(context),
        ),
      ),
    );
  }

  /*void _deleteNote(BuildContext context, Note note, int position) async {
    db.deleteNote(note.id).then((notes) {
      setState(() {
        items.removeAt(position);
      });
    });
  }*/

  void _navigateToNote(BuildContext context, Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(note)),
    );
  }

  void _createNewNote(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(Note('', ''))),
    );
  }
}

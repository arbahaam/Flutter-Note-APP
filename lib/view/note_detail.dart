import 'package:flutter/material.dart';
import 'package:my_note/models/notes.dart';

class NoteDetail extends StatelessWidget {
  final Notes note;

  NoteDetail({Key key, this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Color.fromRGBO(4, 9, 21, 1),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.white,
              ),
              child: Text(
                note.noteTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}

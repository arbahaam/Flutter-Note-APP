import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note_modify.dart';
import '../state/app.state.dart';
import 'home.dart';

// ignore: must_be_immutable

class NoteModify extends StatelessWidget {
  final String noteID;
  NoteModify({this.noteID, this.state});
  final AppState state;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 9, 21, 1),
      appBar: AppBar(title: Text('Create note')),
      body: Consumer<AppState>(
        builder: (context, model, child) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: model.isloading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: TextField(
                        controller: _titleController,
                        decoration: InputDecoration(hintText: 'Note title'),
                      ),
                    ),
                    Container(height: 8),
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: TextField(
                        controller: _contentController,
                        decoration: InputDecoration(
                          hintText: 'Note content',
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 35,
                      child: RaisedButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          model.adNote(
                            AddNote(
                              noteTitle: _titleController.text,
                              noteContent: _contentController.text,
                            ),
                          );
                          model.fetchNotes();
                          // final note = AddNote(
                          //     noteTitle: widget._titleController.text,
                          //     noteContent: widget._contentController.text);

                          // Provider.of<AppState>(context, listen: false)
                          //     .addNote();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
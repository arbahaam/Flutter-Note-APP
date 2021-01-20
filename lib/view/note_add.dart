import 'package:flutter/material.dart';
import 'package:my_note/models/note_modify.dart';

import 'package:my_note/state/app.state.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NoteModify extends StatefulWidget {
  final String noteID;
  NoteModify({this.noteID, this.state});
  final AppState state;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;
  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 9, 21, 1),
      appBar: AppBar(title: Text('Create note')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: widget._isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: TextField(
                      controller: widget._titleController,
                      decoration: InputDecoration(hintText: 'Note title'),
                    ),
                  ),
                  Container(height: 8),
                  Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: TextField(
                      controller: widget._contentController,
                      decoration: InputDecoration(
                          hintText: 'Note content', fillColor: Colors.white),
                    ),
                  ),
                  Container(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: RaisedButton(
                        child: Text('Submit',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            )),
                        color: Colors.white,
                        onPressed: () async {
                          widget.state.adNote(
                            AddNote(
                              noteTitle: widget._titleController.text,
                              noteContent: widget._contentController.text,
                            ),
                          );
                          // final note = AddNote(
                          //     noteTitle: widget._titleController.text,
                          //     noteContent: widget._contentController.text);

                          // Provider.of<AppState>(context, listen: false)
                          //     .addNote();

                          Navigator.of(context).pop();
                        }),
                  )
                ],
              ),
      ),
    );
  }
}

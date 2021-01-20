import 'package:flutter/material.dart';
import 'package:my_note/models/notes.dart';
import 'package:my_note/state/app.state.dart';
import 'package:my_note/view/note_add.dart';
import 'package:my_note/view/note_detail.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key, this.note}) : super(key: key);

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  final Notes note;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, widget) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(4, 9, 21, 1),
        floatingActionButton: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.red),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NoteModify()));
            },
            icon: Icon(Icons.add, color: Colors.white),
            color: Colors.white,
          ),
        ),
        // appBar: AppBar(),
        body: state.isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shadowColor: Colors.white,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            state.notes[index].noteTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(formatDateTime(
                              state.notes[index].createDateTime)),
                          leading: Icon(Icons.notes),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NoteDetail(note: state.notes[index]),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
      );
    });
  }
}

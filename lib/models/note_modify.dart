// To parse this JSON data, do
//
//     final addNote = addNoteFromJson(jsonString);

import 'dart:convert';

AddNote addNoteFromJson(String str) => AddNote.fromJson(json.decode(str));

String addNoteToJson(AddNote data) => json.encode(data.toJson());

class AddNote {
  AddNote({
    this.noteTitle,
    this.noteContent,
  });

  String noteTitle;
  String noteContent;

  factory AddNote.fromJson(Map<String, dynamic> json) => AddNote(
        noteTitle: json["noteTitle"],
        noteContent: json["noteContent"],
      );

  Map<String, dynamic> toJson() => {
        "noteTitle": noteTitle,
        "noteContent": noteContent,
      };
}

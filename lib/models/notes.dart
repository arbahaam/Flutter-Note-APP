// To parse this JSON data, do
//
//     final notes = notesFromJson(jsonString);

import 'dart:convert';

List<Notes> notesFromJson(String str) =>
    List<Notes>.from(json.decode(str).map((x) => Notes.fromJson(x)));

String notesToJson(List<Notes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notes {
  Notes({
    this.noteId,
    this.noteTitle,
    this.createDateTime,
    this.latestEditDateTime,
    this.noteContent,
  });

  String noteId;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  dynamic latestEditDateTime;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        noteId: json["noteID"],
        noteTitle: json["noteTitle"],
        noteContent: json['noteContent'],
        createDateTime: DateTime.parse(json["createDateTime"]),
        latestEditDateTime: json["latestEditDateTime"],
      );

  Map<String, dynamic> toJson() => {
        "noteID": noteId,
        "noteTitle": noteTitle,
        "noteContent": noteContent,
        "createDateTime": createDateTime.toIso8601String(),
        "latestEditDateTime": latestEditDateTime,
      };
}

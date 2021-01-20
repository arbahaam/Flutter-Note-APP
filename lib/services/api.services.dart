// import 'dart:convert';

// import 'package:my_note/models/note_modify.dart';
// import 'package:my_note/models/notes.dart';
// // import 'package:my_note/services/glob_value.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static ApiService _instance;

//   ApiService._();

//   static ApiService get getInstance => _instance = _instance ?? ApiService._();
//   final baseUrl = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
//   Map<String, String> headers() {
//     // final apiKey = LocalData.getInstance.apiKey;
//     return {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'apiKey': 'bee3a2cd-9e8d-4c00-9811-3f2c4dc2d437',
//     };
//   }

//   Future<List<Notes>> getNotes() async {
//     final response = await http.get(
//       Uri.encodeFull(baseUrl + '/notes'),
//       headers: headers(),
//     );
//     if (response.statusCode == 200) {
//       final _body = response.body;
//       final _noteResponse = notesFromJson(_body);
//       return _noteResponse;
//     }
//     throw Exception('Error Occured: ${response.statusCode}');
//   }

//   Future<AddNote> addNote(AddNote note) async {
//     final response = await http.post(Uri.encodeFull(baseUrl + '/notes'),
//         headers: headers(),
//         body: note.toJson(),
//         );
//     if (response.statusCode == 200) {
//       print('Request done');
//     }
//     throw Exception('Error :${response.statusCode}');
//   }

// /*

//   Future<APIResponse<bool>> createNote(NoteManipulation item) {
//     return http.post(API + '/notes', headers: headers, body: json.encode(item.toJson())).then((data) {
//       if (data.statusCode == 201) {
//         return APIResponse<bool>(data: true);
//       }
//       return APIResponse<bool>(error: true, errorMessage: 'An error occured');
//     })
//     .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
//   }

// */

// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/note_modify.dart';
import '../models/notes.dart';

class ApiService {
  static ApiService _instance;

  ApiService._();

  static ApiService get getInstance => _instance = _instance ?? ApiService._();
  final baseUrl = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  Map<String, String> headers() {
    // final apiKey = LocalData.getInstance.apiKey;
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'apiKey': 'bee3a2cd-9e8d-4c00-9811-3f2c4dc2d437',
    };
  }

  Future<List<Notes>> getNotes() async {
    final response = await http.get(
      Uri.encodeFull(baseUrl + '/notes'),
      headers: headers(),
    );
    if (response.statusCode == 200) {
      final _body = response.body;
      final _noteResponse = notesFromJson(_body);
      return _noteResponse;
    }
    throw Exception('Error Occured: ${response.statusCode}');
  }

  Future<AddNote> addNote(AddNote note) async {
    final response = await http.post(
      Uri.encodeFull(baseUrl + '/notes'),
      headers: headers(),
      body: jsonEncode(
        {"noteTitle": note.noteTitle, "noteContent": note.noteContent},
      ),
    );
    if (response.statusCode == 201) {
      final _body = response.body;
      final _addNoteResponse = addNoteFromJson(_body);
      debugPrint("Not başarıyla eklendi");
      return _addNoteResponse;
    }
    throw Exception('Error Occured: ${response.statusCode}');
  }

/*

  Future<APIResponse<bool>> createNote(NoteManipulation item) {
    return http.post(API + '/notes', headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }


*/

}

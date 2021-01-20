import 'package:flutter/material.dart';
import 'package:my_note/models/note_modify.dart';
import 'package:my_note/models/notes.dart';
import 'package:my_note/services/api.services.dart';

class AppState extends ChangeNotifier {
  bool _isLoading;
  bool get isloading => _isLoading;

  List<Notes> _notes;
  List<Notes> get notes => _notes;
  void fetchNotes() async {
    _isLoading = true;
    _notes = await ApiService.getInstance.getNotes();
    _isLoading = false;
    notifyListeners();
  }

  AddNote _addNote;
  AddNote get addNote => _addNote;
  void adNote(AddNote note) async {
    _isLoading = true;
    _addNote = await ApiService.getInstance.addNote(note);
    _isLoading = false;
    notifyListeners();
  }
}

/*

  Future<bool> signUp(SignupModel request) async {
    currentUser = await ApiService.getInstance.signUp(request);
    notifyListeners();
    return currentUser != null;
  }

*/

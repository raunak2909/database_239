import 'package:database_239/app_database.dart';
import 'package:flutter/cupertino.dart';

import 'note_model.dart';

///1
class DatabaseProvider extends ChangeNotifier{
  AppDatabase db;
  DatabaseProvider({required this.db});

  ///2
  List<NoteModel> _listNotes = [];

  ///3 events
  void addNote({required NoteModel newNote}) async{
    db.addNote(newNote: newNote);
    _listNotes = await db.fetchAllNotes();

    notifyListeners();
  }

  List<NoteModel> fetchAllNotes(){
    return _listNotes;
  }

  void getInitialNotes() async{
    _listNotes = await db.fetchAllNotes();
    notifyListeners();
  }

  void updateNote(NoteModel updatedNote, int id){

  }

  void deleteNote(int id){

  }
  ///3

}
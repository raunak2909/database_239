import 'package:database_239/cubit/db_state.dart';
import 'package:database_239/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_database.dart';

class DBCubit extends Cubit<DBState>{
  AppDatabase db;

  DBCubit({required this.db}):super(InitialState());


  /// events
  void addNote({required NoteModel newNote}) async{

   /// loading
   emit(LoadingState());

   bool isNoteAdded = await db.addNote(newNote: newNote);

   if(isNoteAdded){
     List<NoteModel> mData = await db.fetchAllNotes();
     emit(LoadedState(allNotes: mData));
   }else{
     /// error case
     emit(ErrorState(errorMsg: "Note not added!!"));
   }

  }

  void getInitialNotes() async{
    emit(LoadingState());

    List<NoteModel> mData = await db.fetchAllNotes();
    emit(LoadedState(allNotes: mData));

  }

  void updateNote({required NoteModel updatedNote}) async{
    emit(LoadingState());

    bool isNoteUpdated = await db.updateNote(updatedNote);

    if(isNoteUpdated){
      List<NoteModel> mData = await db.fetchAllNotes();
      emit(LoadedState(allNotes: mData));
    } else {
      emit(ErrorState(errorMsg: "Note not updated!!"));
    }

  }


}
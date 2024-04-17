import '../note_model.dart';

abstract class DBState{}

class InitialState extends DBState{}

class LoadingState extends DBState{}

class LoadedState extends DBState{
  List<NoteModel> allNotes;
  LoadedState({required this.allNotes});
}

class ErrorState extends DBState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}
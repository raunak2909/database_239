import 'app_database.dart';

class NoteModel {
  int id;
  String title;
  String desc;
  String createdAt;

  NoteModel({
    required this.title,
    required this.desc,
    required this.createdAt,
    this.id = 0});


  ///map to model
  factory NoteModel.fromMap(Map<String, dynamic> pratik) =>
      NoteModel(
          id: pratik[AppDatabase.COLUMN_NOTE_ID],
          title: pratik[AppDatabase.COLUMN_NOTE_TITLE],
          desc: pratik[AppDatabase.COLUMN_NOTE_DESC],
          createdAt: pratik[AppDatabase.COLUMN_NOTE_CREATED_AT]
      );


  ///model to map
  Map<String, dynamic> toMap() {
    return {
      AppDatabase.COLUMN_NOTE_TITLE: title,
      AppDatabase.COLUMN_NOTE_DESC: desc,
      AppDatabase.COLUMN_NOTE_CREATED_AT: createdAt,
    };
  }
}

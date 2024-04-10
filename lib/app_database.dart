import 'package:database_239/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  ///creating singleton
  AppDatabase._();

  ///accessing the appdb class object
  static final AppDatabase db = AppDatabase._();

  ///creating global static table name and fields
  static const String TABLE_NAME_NOTE = "note";
  static const String COLUMN_NOTE_ID = "note_id";
  static const String COLUMN_NOTE_TITLE = "note_title";
  static const String COLUMN_NOTE_DESC = "note_desc";
  static const String COLUMN_NOTE_CREATED_AT = "note_created_at";

  /// all the logic of database will be provided here

  Database? myDb;

  Future<Database> getDb() async{

    if(myDb!=null){
      return myDb!;
    } else {
      myDb = await initDb();
      return myDb!;
    }

  }

  Future<Database> initDb() async{

    var rootPath = await getApplicationDocumentsDirectory();
    var actualPath = join(rootPath.path, "noteDB.db");

    return await openDatabase(actualPath, version: 1,
        onCreate: (db, version){
      /// do that work which you want to execute in db when for the first time and only time when db is created..
      /// we need to add the tables in here..

      db.execute("create table $TABLE_NAME_NOTE ( $COLUMN_NOTE_ID integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text, $COLUMN_NOTE_CREATED_AT text)");

    });

  }


  /// db create done
  /// table create done

  /// insert data
  addNote({required NoteModel newNote}) async{

    var db = await getDb();

    db.insert(TABLE_NAME_NOTE, newNote.toMap());

  }


  /// fetch data
  Future<List<NoteModel>> fetchAllNotes() async{
    
    var db = await getDb();
    
    var data = await db.query(TABLE_NAME_NOTE);

    List<NoteModel> mData = [];

    for(Map<String, dynamic> eachMap in data){
      var eachModel = NoteModel.fromMap(eachMap);
      mData.add(eachModel);
    }

    return mData;
    
  }

  ///update the note
  updateNote(NoteModel updatedNote) async {

    var db = await getDb();

    db.update(TABLE_NAME_NOTE, updatedNote.toMap(),
        where: "$COLUMN_NOTE_ID = ${updatedNote.id}");

  }

  ///delete the note
  deleteNote(int id) async{
    var db = await getDb();

    db.delete(TABLE_NAME_NOTE,
        where: "$COLUMN_NOTE_ID = ?", whereArgs: ['$id']);

  }




}
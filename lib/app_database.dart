import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  ///creating singleton
  AppDatabase._();

  ///accessing the appdb class object
  static final AppDatabase db = AppDatabase._();

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

    return await openDatabase(actualPath, version: 1, onCreate: (db, version){
      /// do that work which you want to execute in db when for the first time and only time when db is created..
      /// we need to add the tables in here..



    });

  }


  /// db create
  /// table create
  /// insert data
  /// fetch data


}
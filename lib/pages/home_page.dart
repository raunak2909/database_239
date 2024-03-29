import 'package:database_239/app_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppDatabase? db;
  List<Map<String, dynamic>> mData = [];

  @override
  void initState() {
    super.initState();
    db = AppDatabase.db; //accessing the database class object
    getNotes();
  }

  void getNotes() async{
    mData = await db!.fetchAllNotes();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      body: mData.isNotEmpty ? ListView.builder(
        itemCount: mData.length,
          itemBuilder: (_, index){
          return ListTile(
            title: Text(mData[index][AppDatabase.COLUMN_NOTE_TITLE]),
            subtitle: Text(mData[index][AppDatabase.COLUMN_NOTE_DESC]),
          );
      }) : Center(
        child: Text('No Notes yet!!'),
      ), ///fetch note from database
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ///add note into database
          db!.addNote(title: "New Note", desc: "Do what makes you happy.");
          getNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



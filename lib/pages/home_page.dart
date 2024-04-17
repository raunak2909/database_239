import 'package:database_239/app_database.dart';
import 'package:database_239/cubit/db_cubit.dart';
import 'package:database_239/cubit/db_state.dart';
import 'package:database_239/databse_provider.dart';
import 'package:database_239/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../note_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dateFormat = DateFormat.MMMMEEEEd();

  //AppDatabase? db;
  //List<NoteModel> mData = [];

  @override
  void initState() {
    super.initState();
    ///default
    //db = AppDatabase.db; //accessing the database class object
    //getNotes();

    ///provider
    //context.read<DatabaseProvider>().getInitialNotes();

    ///cubit
    context.read<DBCubit>().getInitialNotes();
  }

  /*void getNotes() async {
    mData = await db!.fetchAllNotes();
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {

    ///
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      ///6
      /*body: Consumer<DatabaseProvider>(
        builder: (_, value, __){
          var mData = value.fetchAllNotes();
          return mData.isNotEmpty
              ? ListView.builder(
              itemCount: mData.length,
              itemBuilder: (_, index) {
                var time = dateFormat.format(
                    DateTime.fromMillisecondsSinceEpoch(
                        int.parse(mData[index].createdAt)));
                print(time);

                return ListTile(
                  onTap: () {
                    *//*
                    db!.updateNote(updatedNote);

                    getNotes();
*//*
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(isUpdate: true, noteModel: mData[index],),));


                  },
                  leading: Text('${index+1}'),
                  title: Text(mData[index].title),
                  subtitle: Text(mData[index].desc),
                  trailing: InkWell(
                    onTap: () {
                      *//*db!.deleteNote(mData[index].id);
                      getNotes();*//*

                      Provider.of<DatabaseProvider>(context, listen: false).deleteNote(mData[index].id);
                    },
                    child: Icon(Icons.add),
                  ),
                );
              })
              : Center(
            child: Text('No Notes yet!!'),
          );
        },
      ),*/

      body: BlocBuilder<DBCubit, DBState>(
        builder: (_, state){
          if(state is LoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is ErrorState){
            return Center(
              child: Text('Error: ${state.errorMsg}'),
            );
          } else if(state is LoadedState){
            var mData = state.allNotes;
            return mData.isNotEmpty
                ? ListView.builder(
                itemCount: mData.length,
                itemBuilder: (_, index) {
                  var time = dateFormat.format(
                      DateTime.fromMillisecondsSinceEpoch(
                          int.parse(mData[index].createdAt)));
                  print(time);

                  return ListTile(
                    onTap: () {
                      /*
                    db!.updateNote(updatedNote);

                    getNotes();
*/
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(isUpdate: true, noteModel: mData[index],),));


                    },
                    leading: Text('${index+1}'),
                    title: Text(mData[index].title),
                    subtitle: Text(mData[index].desc),
                    trailing: InkWell(
                      onTap: () {
                        /*db!.deleteNote(mData[index].id);
                      getNotes();*/

                        Provider.of<DatabaseProvider>(context, listen: false).deleteNote(mData[index].id);
                      },
                      child: Icon(Icons.add),
                    ),
                  );
                })
                : Center(
              child: Text('No Notes yet!!'),
            );
          }
          return Container();
        },
      ),


      ///fetch note from database
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///add note into database
          /*db!.addNote(
              newNote: NoteModel(
                  title: "New Note",
                  desc: "Do what makes you happy.",
                  createdAt: DateTime.now().millisecondsSinceEpoch.toString()));
          getNotes();*/

          ///5
          ///after provider integration

         /* context.read<DatabaseProvider>().addNote(
              newNote: NoteModel(
                  title: "New Note",
                  desc: "Do what makes you happy.",
                  createdAt: DateTime.now().millisecondsSinceEpoch.toString()));*/

          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

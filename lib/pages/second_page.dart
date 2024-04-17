import 'package:database_239/cubit/db_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../databse_provider.dart';
import '../note_model.dart';

class SecondPage extends StatelessWidget {
  bool isUpdate;
  NoteModel? noteModel;
  SecondPage({this.isUpdate = false, this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? "Update Note" : "Add Note"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          if(isUpdate){
            /*var updatedNote = NoteModel(title: "Updated Note", desc: "Updated desc", createdAt: noteModel!.createdAt, id: noteModel!.id);
            context.read<DatabaseProvider>().updateNote(updatedNote);*/

            var updatedNote = NoteModel(title: "Updated Note", desc: "Updated desc", createdAt: noteModel!.createdAt, id: noteModel!.id);
            context.read<DBCubit>().updateNote(updatedNote: updatedNote);
          } else {
            /*context.read<DatabaseProvider>().addNote(
                newNote: NoteModel(
                    title: "New Note",
                    desc: "Do what makes you happy.",
                    createdAt: DateTime
                        .now()
                        .millisecondsSinceEpoch
                        .toString()));*/

            ///cubit
            context.read<DBCubit>().addNote(newNote: NoteModel(
                title: "New Note",
                desc: "Do what makes you happy.",
                createdAt: DateTime
                    .now()
                    .millisecondsSinceEpoch
                    .toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

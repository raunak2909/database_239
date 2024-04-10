import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../databse_provider.dart';
import '../note_model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<DatabaseProvider>().addNote(
              newNote: NoteModel(
                  title: "New Note",
                  desc: "Do what makes you happy.",
                  createdAt: DateTime.now().millisecondsSinceEpoch.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

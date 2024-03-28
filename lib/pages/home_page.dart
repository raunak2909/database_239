import 'package:database_239/app_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var db = AppDatabase.db; //accessing the database class object

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      body: Container(),
    );
  }
}



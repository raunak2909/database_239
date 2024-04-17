import 'package:database_239/app_database.dart';
import 'package:database_239/cubit/db_cubit.dart';
import 'package:database_239/databse_provider.dart';
import 'package:database_239/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DBCubit(db: AppDatabase.db),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        ///4
        home: HomePage());
  }
}

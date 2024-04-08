
import 'package:flutter/material.dart';
import 'package:flutter_test_app/24_add.dart';
import 'package:flutter_test_app/24_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// 24 databases
void main() { 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();
    return MaterialApp(
      // home: DatabaseApp(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DatabaseApp(database),
        '/add': (context) => AddTodoApp(database)
      }
    );
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todos(id INTERGER PRIMARY KEY AUTOINCREMENT, "
          "title TEXT, content TEXT, active INTEGER)",
        );
      },
      version: 1,
    );
  }

}

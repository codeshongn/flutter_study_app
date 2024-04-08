import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseApp extends StatefulWidget {
  final Future<Database> db;
  DatabaseApp(this.db);

  @override
  State<StatefulWidget> createState() => _DatabaseApp();
}

class _DatabaseApp extends State<DatabaseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Database Example'),),
      body: Container(
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todo = await Navigator.of(context).pushNamed('/add');
        }, 
        child: Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_test_app/todo.dart';
import 'package:sqflite/sqflite.dart';

class ClearList extends StatefulWidget {
  Future<Database> db;
  ClearList(this.db);

  @override
  State<StatefulWidget> createState() => _ClearList();
}

class _ClearList extends State<ClearList> {
  Future<List<Todo>>? clearList;

  @override
  void initState() {
    super.initState();
    clearList = getClearList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('completed task')),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: clearList, 
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return CircularProgressIndicator();
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        Todo todo = (snapshot.data as List<Todo>)[index];
                        return ListTile(
                          title: Text(todo.title!, style: TextStyle(fontSize: 20),),
                          subtitle: Container(
                            child: Column(
                              children: <Widget>[
                                Text(todo.content!),
                                Text('체크 : ${todo.active == 1? 'true' : 'false'}'),
                                Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: (snapshot.data as List<Todo>).length,
                    );
                  } else {
                    return Text('No data');
                  }
              }
          })
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('완료한 일 삭제'),
              content: Text('완료한 일 모두 지우기'),
              actions: <Widget>[
                TextButton(onPressed: () {
                  Navigator.of(context).pop(true);
                }, child: Text('Yes')),
                TextButton(onPressed: () {
                  Navigator.of(context).pop(false);
                }, child: Text('No'))
              ],
            );
        });
        if (result == true) {
          _removeAll();
        }
      }, child: Icon(Icons.delete)),
    );
  }

  Future<List<Todo>> getClearList() async {
    final Database database = await widget.db;
    List<Map<String, dynamic>> maps = await database.rawQuery(
      'select title, content, id from todos where active = 1');

    return List.generate(maps.length, (index) {
      return Todo(
      title: maps[index]['title'].toString(),
      content: maps[index]['content'].toString(),
      id: maps[index]['id']);
    });
  }

  void _removeAll() async {
    final Database database = await widget.db;
    database.rawDelete('delete from todos where active=1');
    setState(() {
      clearList = getClearList();
    });
  }
}
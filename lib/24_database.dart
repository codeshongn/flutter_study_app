import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/todo.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseApp extends StatefulWidget {
  final Future<Database> db;
  DatabaseApp(this.db);

  @override
  State<StatefulWidget> createState() => _DatabaseApp();
}

class _DatabaseApp extends State<DatabaseApp> {
  Future<List<Todo>>? todoList;

  @override
  void initState() {
    super.initState();
    todoList = getTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Example'),
        actions: <Widget>[
          TextButton(onPressed: () async {
            Navigator.of(context).pushNamed('/clear');
            setState(() {
              todoList = getTodos();
            });
          }, child: Text('Completed task', style: TextStyle(color: Colors.red),))
        ],),
      body: Container(
        child: Center(
          child: FutureBuilder(
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
                        // return Card(
                        //   child: Column(
                        //     children: <Widget>[
                        //       Text(todo.title!),
                        //       Text(todo.content!),
                        //       Text('${todo.active == 1? 'true' : 'false'}'),
                        //     ],
                        //   ),
                        // );
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
                          onTap: () async {
                            TextEditingController controller = TextEditingController(text: todo.content);

                            Todo result = await showDialog(
                              context: context, 
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: Text('${todo.id} : ${todo.title}'),
                                  // content: Text('Todo를 체크하시겠습니까?'),
                                  // actions: <Widget>[
                                  //   TextButton(onPressed: () {
                                  //     setState(() {
                                  //       todo.active == 1? todo.active = 0 : todo.active = 1;
                                  //     });
                                  //     Navigator.of(context).pop(todo);
                                  //   }, child: Text('예')),
                                  //   TextButton(onPressed: () {
                                  //     Navigator.of(context).pop();
                                  //   }, child: Text('아니요'))
                                  // ]
                                  title: Text('${todo.id} : ${todo.title}'),
                                  content: TextField(
                                    controller: controller,
                                    keyboardType: TextInputType.text,
                                  ),
                                  actions: <Widget>[
                                    TextButton(onPressed: () {
                                      todo.active == 1? todo.active = 0 : todo.active = 1;
                                      todo.content = controller.value.text;
                                      Navigator.of(context).pop(todo);
                                    }, child: Text('예') ),
                                    TextButton(onPressed: () {
                                      Navigator.of(context).pop();
                                    }, child: Text('아니요'))
                                  ]
                                );
                            });
                            _updateTodo(result);
                          },
                          onLongPress: () async {
                            Todo result = await showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('${todo.id} : ${todo.title}'),
                                content: Text('${todo.content}를 삭제하시겠습니까?'),
                                actions: <Widget>[
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop(todo);
                                  }, child: Text('Yes')),
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();
                                  }, child: Text('No'))
                                ],
                              );
                            });

                            _deleteTodo(result);
                          },
                        );
                      },
                      itemCount: (snapshot.data as List<Todo>).length,
                    );
                  } else {
                    return Text('No data');
                  }
              }
              // return CircularProgressIndicator();
            },
            future: todoList
          ),
        ),
      ),
      floatingActionButton: Column(
        children: <Widget>[
          FloatingActionButton(onPressed: () async {
            final todo = await Navigator.of(context).pushNamed('/add');
            if (todo != null) {
              _insertTodo(todo as Todo);
            }
          }, 
          heroTag: null,
          child: Icon(Icons.add)),
          SizedBox(height: 10,),
          FloatingActionButton(onPressed: () async {
            _allUpdate();
          }, 
          heroTag: null,
          child: Icon(Icons.update))
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _insertTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.insert('todos', todo.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);

    setState(() {
      todoList = getTodos();
    });
  }

  Future<List<Todo>> getTodos() async {
    final Database database = await widget.db;
    final List<Map<String, dynamic>> maps = await database.query('todos');

    return List.generate(maps.length, (index) {
      int active = maps[index]['active'] == 1? 1 : 0;
      return Todo(
        title: maps[index]['title'].toString(),
        content: maps[index]['content'].toString(),
        active: active,
        id: maps[index]['id']
      );
    });
  }

  void _updateTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
    setState(() {
      todoList = getTodos();
    });
  }

  void _deleteTodo(Todo todo) async {
  final Database database = await widget.db;
  await database.delete(
    'todos',
    where: 'id = ?',
    whereArgs: [todo.id],
    );
    setState(() {
      todoList = getTodos();
    }
  );
}

void _allUpdate() async {
  final Database database = await widget.db;
  await database.rawUpdate(
    'update todos set active = 1 where active = 0'
  );
  setState(() {
    todoList = getTodos();
  });
}
}


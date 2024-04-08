import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class FileApp extends StatefulWidget {
  @override
  State<FileApp> createState() => _FileApp();
}

class _FileApp extends State<FileApp> {
  int _count = 0;
  List<String> itemList = List.empty(growable: true);
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // readCountFile();
    initData();
  }

  void initData() async {
    var result = await readListFile();
    setState(() {
      itemList.addAll(result);
    });
  }

  Future<List<String>> readListFile() async {
    
    var key = 'first';
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? firstCheck = pref.getBool(key);
    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File(dir.path + '/fruit.txt').exists();

    if (firstCheck == null || firstCheck == false || fileExist == false) {
      pref.setBool(key, true);
      var file = await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
      File(dir.path + '/fruit.txt').writeAsStringSync(file);
      
      var array = file.split("\n");
      for (var item in array) {
        print(item);
        itemList.add(item);
      }

      return itemList;
    } else {
      var file = await File(dir.path + "/fruit.txt").readAsString();
      var array = file.split("\n");
      for (var item in array) {
        print(item);
        itemList.add(item);
      }

      return itemList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('File App Test')),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              Expanded(
                child: ListView.builder(
                itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(
                      itemList[index],
                      style: TextStyle(fontSize: 30),
                    )
                  )
                );
              },
              itemCount: itemList.length,)),
              FloatingActionButton(onPressed: () {
                _writeFruit(controller.value.text);
                setState(() {
                  itemList.add(controller.value.text);
                });
              }, child: Icon(Icons.add)),
            ],
          ),
        )
      ),),
    );
  }

  void _writeFruit(String fruit) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = await File(dir.path + '/fruit.txt').readAsString();

    file = file + '\n' + fruit;
    File(dir.path + '/fruit.txt').writeAsStringSync(file);
  }
}
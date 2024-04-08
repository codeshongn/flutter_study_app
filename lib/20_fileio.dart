
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// 20 file io
void main() {
runApp( FileApp());
} 
class FileApp extends StatefulWidget {
  @override
  _FileApp createState() => _FileApp();
}

class _FileApp extends State<FileApp> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _readCountFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('File Example')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _count++;
            });
            _writeCountFile(_count);
          },
        ),
        body: Container(
          child: Center(
            child: Text(
              '$_count',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      )
    );
  }

  void _writeCountFile(int count) async {
    var dir = await getApplicationDocumentsDirectory();
    File(dir.path + '/count.txt').writeAsStringSync(count.toString());
  }

  void _readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = await File(dir.path + '/count.txt').readAsString();
      print(file);
      setState(() {
        _count = int.parse(file);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test_app/30_memoPage.dart';

// 30 memo
void main() { 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: DatabaseApp(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MemoPage(),
    );
  }
}

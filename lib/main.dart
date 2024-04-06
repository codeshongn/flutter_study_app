
import 'package:flutter/material.dart';
import 'package:flutter_test_app/largeFileMain.dart';
import 'package:flutter_test_app/secondDetail.dart';
import 'package:flutter_test_app/subdetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 18 navigation2
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubPage2 Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FirstPage(),
      initialRoute: '/',
      routes: {'/': (context) => SubDetail(), '/second': (context) => SecondDetail()},
      
    );
  }
}
